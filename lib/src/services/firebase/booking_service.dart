part of firebase_service;

@Injectable()
class BookingService extends FirebaseServiceBase<Booking>
{
  BookingService() : super("bookings");

  @override
  Booking createModelInstance(String id, Map<String, dynamic> data) => new Booking.decode(id, data);

  /**
   * Find all cached bookings for the specified room id overlapping the specified time
   */
  Booking getByTimeAndRoomId(DateTime time, String room_id)
  {
    return _cachedModels.values.firstWhere((ModelBase b) =>
    (b as Booking).roomId == room_id && ((b as Booking).startTime.isAtSameMomentAs(time) || ((b as Booking).startTime.isBefore(time) && (b as Booking).endTime.isAfter(time))), orElse: () => null);
  }

  @override
  Future<String> push(ModelBase model) async
  {
    Booking b = model as Booking;
    if (getByTimeAndRoomId(b.startTime, b.roomId) != null) throw new Exception("This time (${b.startTime}) has already been booked");
    b.cancelCode = await _generateUniqueCancelCode();
    b.id = await super.push(model);
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

    Day day = await day_service.fetch(booking.dayId, force: true);
    if (day != null)
    {
      day.increments.where((inc) => inc.userStates[booking.userId]?.bookingId == booking.id).forEach((i)
      {
        i.userStates[booking.userId].bookingId = null;
        /// Reset state to open, clearing any after-margin
        i.userStates[booking.userId].state = "open";
      });
      await day_service.set(day);
    }

    User user = await user_service.fetch(booking.userId);
    if (user != null)
    {
      user.bookingIds.removeWhere((id) => id == booking.id);
      await user_service.patchBookings(user);
    }

    Salon salon = await salon_service.fetch(booking.salonId);
    if (salon != null)
    {
      salon.bookingIds.removeWhere((id) => id == booking.id);
      await salon_service.patchBookings(salon);
    }

    Customer customer = await customer_service.fetch(booking.customerId);
    if (customer != null)
    {
      customer.bookingIds.remove(booking.id);
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

    Day day = await day_service.fetch(booking.dayId, force: true);
    Service service = await service_service.fetch(booking.serviceId);
    if (day != null)
    {
      DateTime iTime = new DateTime.fromMillisecondsSinceEpoch(booking.startTime.millisecondsSinceEpoch);
      DateTime endTimeWithMargin = booking.endTime.add(service.afterMargin);

      while (iTime.isBefore(endTimeWithMargin))
      {
        Increment increment = day.increments.firstWhere((i) => i.startTime.isAtSameMomentAs(iTime), orElse: () => null);

        if (increment != null)
        {
          increment.userStates[booking.userId].bookingId = booking.id;
          /// After-margin
          if (increment.endTime.isAfter(booking.endTime)) { increment.userStates[booking.userId].state = "margin"; }
        }
        iTime = iTime.add(Increment.duration);
      }
      await day_service.set(day);
    }

    User user = await user_service.fetch(booking.userId);
    if (user != null && !user.bookingIds.contains(booking.id))
    {
      user.bookingIds.add(booking.id);
      await user_service.patchBookings(user);
    }

    Salon salon = await salon_service.fetch(booking.salonId);
    if (salon != null && !salon.bookingIds.contains(booking.id))
    {
      salon.bookingIds.add(booking.id);
      await salon_service.patchBookings(salon);
    }

    Customer customer = await customer_service.fetch(booking.customerId);
    if (customer != null && !customer.bookingIds.contains(booking.id))
    {
      customer.bookingIds.add(booking.id);
      await customer_service.patchBookings(customer);
    }

    _loading = false;
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

