part of firebase_service;

@Injectable()
class BookingService extends FirebaseServiceBase<Booking>
{
  BookingService() : super("bookings");

  /**
   * Find all cached bookings for the specified room id overlapping the specified time
   */
  Booking getByTimeAndRoomId(DateTime time, String room_id)
  {
    return _cachedModels.values.firstWhere((Booking b) => b.room_id == room_id && ((b.start_time.isAtSameMomentAs(time) || b.start_time.isBefore(time) && b.end_time.isAfter(time))), orElse: () => null);
  }

  @override
  Future<String> push(Booking b) async
  {
    if (getByTimeAndRoomId(b.start_time, b.room_id) != null) throw new Exception("This time (${b.start_time}) has already been booked");
    b.cancel_code = await _generateUniqueCancelCode();
    b.id = await super.push(b);
    return b.id;
  }

  /**
   * Remove the booking from its user, salon and customer, and reset its increments to open state.
   * This method is public so that it can be called before updating the model (which will invalidate patch data)
   */
  Future patchRemove(Booking booking, CustomerService customer_service, DayService day_service, SalonService salon_service, UserService user_service) async
  {
    if (booking == null) return;

    _loading = true;

    Day day = await day_service.fetch(booking.day_id, force: true);
    if (day != null)
    {
      day.increments.where((inc) => inc.user_states[booking.user_id]?.booking_id == booking.id).forEach((i)
      {
        i.user_states[booking.user_id].booking_id = null;
        /// Reset state to open, clearing any after-margin
        i.user_states[booking.user_id].state = "open";
      });
      await day_service.set(day);
    }

    User user = await user_service.fetch(booking.user_id);
    if (user != null)
    {
      user.booking_ids.removeWhere((id) => id == booking.id);
      await user_service.patchBookings(user);
    }

    Salon salon = await salon_service.fetch(booking.salon_id);
    if (salon != null)
    {
      salon.booking_ids.removeWhere((id) => id == booking.id);
      await salon_service.patchBookings(salon);
    }

    Customer customer = await customer_service.fetch(booking.customer_id);
    if (customer != null)
    {
      customer.booking_ids.remove(booking.id);
      await customer_service.patchBookings(customer);
    }

    _loading = false;
  }

  /**
   * Add a reference of the booking to its user, salon and customer, and set its increments to closed state
   * Param [remote]: specify if the remote server should be patched (no need to patch server if the changes came from there)
   */

  Future patchAdd(Booking booking, CustomerService customer_service, DayService day_service, SalonService salon_service, ServiceService service_service, UserService user_service) async
  {
    if (booking == null) return;

    _loading = true;

    Day day = await day_service.fetch(booking.day_id, force: true);
    Service service = await service_service.fetch(booking.service_id);
    if (day != null)
    {
      DateTime iTime = new DateTime.fromMillisecondsSinceEpoch(booking.start_time.millisecondsSinceEpoch);
      DateTime endTimeWithMargin = booking.end_time.add(service.after_margin);

      while (iTime.isBefore(endTimeWithMargin))
      {
        Increment increment = day.increments.firstWhere((i) => i.start_time.isAtSameMomentAs(iTime), orElse: () => null);

        if (increment != null)
        {
          increment.user_states[booking.user_id].booking_id = booking.id;
          /// After-margin
          if (increment.end_time.isAfter(booking.end_time)) { increment.user_states[booking.user_id].state = "margin"; }
        }
        iTime = iTime.add(Increment.duration);
      }
      await day_service.set(day);
    }

    User user = await user_service.fetch(booking.user_id);
    if (user != null && !user.booking_ids.contains(booking.id))
    {
      user.booking_ids.add(booking.id);
      await user_service.patchBookings(user);
    }

    Salon salon = await salon_service.fetch(booking.salon_id);
    if (salon != null && !salon.booking_ids.contains(booking.id))
    {
      salon.booking_ids.add(booking.id);
      await salon_service.patchBookings(salon);
    }

    Customer customer = await customer_service.fetch(booking.customer_id);
    if (customer != null && !customer.booking_ids.contains(booking.id))
    {
      customer.booking_ids.add(booking.id);
      await customer_service.patchBookings(customer);
    }

    _loading = false;
  }

  @override
  Booking createModelInstance(Map<String, dynamic> data)
  {
    Booking booking = new Booking();
    if (data != null) booking.addAll(data);
    return booking;
  }

  @override
  Map<String, dynamic> _serialize(Booking model)
  {
    Map<String, dynamic> data = super._serialize(model);
    data["start_time"] = model.start_time == null ? null : timestamp.format(model.start_time);
    data["end_time"] = model.end_time == null ? null : timestamp.format(model.end_time);
    data["duration"] = model.duration?.inMinutes;
    return data;
  }

  @override
  Booking _deserialize(Map<String, dynamic> data)
  {
    try
    {
      data["start_time"] = DateTime.parse(data["start_time"]);
      data["end_time"] = DateTime.parse(data["end_time"]);
      data["duration"] = new Duration(minutes: data["duration"]);
      return super._deserialize(data);
    }
    catch (e, s)
    {
      print(e);
      print(s);
      return null;
    }
  }

  Future<String> _generateUniqueCancelCode() async
  {
    firebase.QueryEvent qe;
    String cancelCode;
    while (qe == null || qe.snapshot.exists())
    {
      /// generate random string "abc123"
      final int alphaStart = 65;
      final int alphaEnd = 90;
      final int numStart = 48;
      final int numEnd = 57;
      Random rnd = new Random();
      List<int> charCodes = new List(6);
      for (int i = 0; i < 3; i++) charCodes[i] = rnd.nextInt(alphaEnd - alphaStart) + alphaStart;
      for (int i = 3; i < 6; i++) charCodes[i] = rnd.nextInt(numEnd - numStart) + numStart;

      cancelCode = new String.fromCharCodes(charCodes);
      qe = await firebase.database().ref('bookings').orderByChild("cancel_code").equalTo(cancelCode).once("value");
    }
    return cancelCode;
  }

  Booking rebookBuffer;
}

