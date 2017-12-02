part of model_base;

class Day extends ModelBase
{
  static const int startHour = 8;
  static const int startMinute = 0;
  static const int endHour = 20;
  static const int endMinute = 0;

  @override
  Day(String id, String salon_id, DateTime date) : super(id)
  {
    salonId = salon_id;
    startTime = new DateTime(date.year, date.month, date.day, startHour, startMinute);
    endTime = new DateTime(date.year, date.month, date.day, endHour, endMinute);

    // Populate day with a full set of inactive increments for every user
    increments = new List<Increment>();

    DateTime iTime = startTime;
    while (iTime.isBefore(endTime))
    {
      increments.add(new Increment(iTime));
      iTime = iTime.add(Increment.duration);
    }
  }

  @override
  Day.from(Day other) : super.from(other);

  @override
  Day.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    salonId = d["salon_id"];
    startTime = DateTime.parse(d["start_time"]);
    endTime = DateTime.parse(d["end_time"]);
    increments = d["increments"].map((row) => new Increment.decode(row)).toList(growable: false);
  }

  @override
  Map<String, String> get encoded
  {
    Map<String, dynamic> d = super.encoded;
    d["increments"] = increments.map((increment) => increment.encoded).toList(growable: false);
    return d;
  }

 // @override
  //List<String> get tableColumns => ["start_time", "salon_id"];


  bool isPopulated(String salon_id, String user_id)
  {
    if (id == null || salonId != salon_id) return false;
    else if (user_id == null) return increments.where((i) => i.userStates.isNotEmpty).isNotEmpty;
    else return increments.where((i) => i.userStates.containsKey(user_id)).isNotEmpty;
  }

  bool hasBookings(String user_id)
  {
    if (user_id == null) return false;
    return increments.firstWhere((i) => i.userStates.containsKey(user_id) && i.userStates[user_id].bookingId != null, orElse: () => null) != null;
  }

  bool isSameDateAs(DateTime dt) => (startTime.year == dt.year && startTime.month == dt.month && startTime.day == dt.day);
  bool containsUser(String user_id) => increments.firstWhere((i) => i.userStates.containsKey(user_id), orElse: () => null) != null;

  List<Increment> get increments => data["increments"];
  DateTime get startTime => data["start_time"];
  DateTime get endTime => data["end_time"];
  String get strStartTime => ModelBase.timestampFormat(startTime);
  String get strEndTime => ModelBase.timestampFormat(endTime);
  String get salonId => data["salon_id"];

  void set increments(List<Increment> value) { data["increments"] = value; }
  void set startTime(DateTime value) { data["start_time"] = value; }
  void set endTime(DateTime value) { data["end_time"] = value; }
  void set salonId(String value) { data["salon_id"] = value; }
}