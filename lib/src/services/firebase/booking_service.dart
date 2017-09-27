part of firebase_service;

@Injectable()
class BookingService extends FirebaseServiceBase
{
  BookingService() : super("bookings");

  @override
  Booking createModelInstance(String id, Map<String, dynamic> data) => new Booking.decode(id, data);

  /**
   * Find all cached bookings for the specified room id overlapping the specified time
   */
  Booking getByTimeAndRoomId(DateTime time, String room_id)
  {
    return _cachedModels.values.firstWhere((Booking b) =>
    b.roomId == room_id && (b.startTime.isAtSameMomentAs(time) || (b.startTime.isBefore(time) && b.endTime.isAfter(time))), orElse: () => null);
  }

  @override
  Future<String> push(Booking model) async
  {
    if (getByTimeAndRoomId(model.startTime, model.roomId) != null) throw new Exception("This time (${model.startTime}) has already been booked");
    model.cancelCode = await _generateUniqueCancelCode();
    model.id = await super.push(model);
    return model.id;
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
      await day_service.set(day.id, day);
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
      await day_service.set(day.id, day);
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
      cancelCode = rs.randomAlphaNumeric(7).toUpperCase();
      qe = await firebase.database().ref('bookings').orderByChild("cancel_code").equalTo(cancelCode).once("value");
    }
    return cancelCode;
  }

  Booking rebookBuffer;
}

