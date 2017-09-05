part of firebase_service;

@Injectable()
class BookingService extends FirebaseServiceBase
{
  BookingService(this._customerService, this._dayService, this._salonService, this._serviceService, this._userService) : super("bookings");

  @override
  Booking createModelInstance(String id, Map<String, dynamic> data) => new Booking.decode(id, data);

  /**
   * Find all cached bookings for the specified room id overlapping the specified time
   */
  Booking findCached(DateTime time, String room_id)
  {
    return _cachedModels.values.firstWhere((Booking b) =>
    b.roomId == room_id && (b.startTime.isAtSameMomentAs(time) || (b.startTime.isBefore(time) && b.endTime.isAfter(time))), orElse: () => null);
  }

  @override
  Future<String> push(Booking model) async
  {
    if (findCached(model.startTime, model.roomId) != null) throw new Exception("This time has already been booked");
    model.cancelCode = await _generateUniqueCancelCode();
    model.id = await super.push(model);
    await _patchAdd(model, update_remote: true);

    return model.id;
  }

  @override
  Future set(String id, Booking model) async
  {
    await super.set(id, model);
    await _patchAdd(model, update_remote: true);
  }

  /**
   * Remove the booking from its user, salon and customer, and reset its increments to open state.
   * This method is public so that it can be called before updating the model (which will invalidate patch data)
   * Param [remote]: specify if the remote server should be patched (no need to patch server if the changes came from there)
   */
  Future patchRemove(Booking booking, {bool update_remote: false}) async
  {
    if (booking == null) return;

    _loading = true;
    /// Increments
    Day day = await _dayService.fetch(booking.dayId);
    User user = await _userService.fetch(booking.userId);
    Salon salon = await _salonService.fetch(booking.salonId);
    Customer customer = await _customerService.fetch(booking.customerId);

    if (day != null)
    {
      day.increments.where((inc) => inc.userStates[booking.userId]?.bookingId == booking.id).forEach((i)
      {
        i.userStates[booking.userId].bookingId = null;
        /// Reset state to open, clearing any after-margin
        i.userStates[booking.userId].state = "open";
      });
      if (update_remote == true) await _dayService.set(day.id, day);
    }

    /// User->bookings
    if (user != null)
    {
      user.bookingIds.removeWhere((id) => id == booking.id);
      if (update_remote == true) await _userService.patchBookings(user);
    }

    /// Salon->bookings
    if (salon != null)
    {
      salon.bookingIds.removeWhere((id) => id == booking.id);
      if (update_remote == true) await _salonService.patchBookings(salon);
    }

    /// Customer->bookings
    if (customer != null)
    {
      customer.bookingIds.remove(booking.id);
      if (update_remote == true) await _customerService.patchBookings(customer);
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

  @override
  Future<Booking> _onChildAdded(firebase.QueryEvent e) async
  {
    Booking booking = await super._onChildAdded(e);
    await _patchAdd(booking, update_remote: false);
    return booking;
  }

  @override
  Future<Booking> _onChildChanged(firebase.QueryEvent e) async
  {
    Booking booking = await fetch(e.snapshot.key);

    /**
     * Patch customer, salon, and increments locally so that any references to the old booking is removed
     */
    await patchRemove(booking, update_remote: false);

    // Update model
    await super._onChildChanged(e);

    /**
     * Patch customer, salon, and increments locally to reflect the new booking
     */
    await _patchAdd(booking, update_remote: false);

    return booking;
  }

  @override
  Future _onChildRemoved(firebase.QueryEvent e) async
  {
    await patchRemove(await fetch(e.snapshot.key), update_remote: false);
    await super._onChildRemoved(e);
  }

  /**
   * Add a reference of the booking to its user, salon and customer, and set its increments to closed state
   * Param [remote]: specify if the remote server should be patched (no need to patch server if the changes came from there)
   */
  Future _patchAdd(Booking booking, {bool update_remote: false}) async
  {
    if (booking == null) return;

    _loading = true;

    Day day = await _dayService.fetch(booking.dayId);
    User user = await _userService.fetch(booking.userId);
    Salon salon = await _salonService.fetch(booking.salonId);
    Customer customer = await _customerService.fetch(booking.customerId);
    Service service = await _serviceService.fetch(booking.serviceId);

    /// Increments
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
      if (update_remote == true) await _dayService.set(day.id, day);
    }

    /// User->bookings
    if (user != null && !user.bookingIds.contains(booking.id))
    {
      user.bookingIds.add(booking.id);
      if (update_remote == true) await _userService.patchBookings(user);
    }

    /// Salon->bookings
    if (salon != null && !salon.bookingIds.contains(booking.id))
    {
      salon.bookingIds.add(booking.id);
      if (update_remote == true) await _salonService.patchBookings(salon);
    }

    /// Customer->bookings
    if (customer != null && !customer.bookingIds.contains(booking.id))
    {
      customer.bookingIds.add(booking.id);
      if (update_remote == true) await _customerService.patchBookings(customer);
    }
    _loading = false;
  }

  Booking rebookBuffer;
  final CustomerService _customerService;
  final DayService _dayService;
  final SalonService _salonService;
  final ServiceService _serviceService;
  final UserService _userService;
}

