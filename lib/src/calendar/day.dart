part of model_base;

@Serializable()
class Day extends _$DaySerializable implements FoModel
{
  static const int startHour = 8;
  static const int startMinute = 0;
  static const int endHour = 20;
  static const int endMinute = 0;

  Day() {}

  Day.data(this.salon_id, DateTime date)
  {
    start_time = new DateTime(date.year, date.month, date.day, startHour, startMinute);
    end_time = new DateTime(date.year, date.month, date.day, endHour, endMinute);

    DateTime iTime = start_time;
    while (iTime.isBefore(end_time))
    {
      increments.add(new Increment(iTime));
      iTime = iTime.add(Increment.duration);
    }
  }

  List<Increment> increments = new List();
  DateTime start_time;
  DateTime end_time;
  String salon_id;

  String id;
  String added_by;
  DateTime created;
  String status;

  bool isPopulated(String salonId, String userId)
  {
    if (id == null || salon_id != salonId) return false;
    else if (userId == null) return increments.where((i) => i.user_states.isNotEmpty).isNotEmpty;
    else return increments.where((i) => i.user_states.containsKey(userId)).isNotEmpty;
  }

  bool hasBookings(String user_id)
  {
    if (user_id == null) return false;
    return increments.firstWhere((i) => i.user_states.containsKey(user_id) && i.user_states[user_id].booking_id != null, orElse: () => null) != null;
  }
}