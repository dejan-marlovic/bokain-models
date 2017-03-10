part of model_base;

class Day extends ModelBase
{
  static const int startHour = 8;
  static const int startMinute = 0;
  static const int endHour = 20;
  static const int endMinute = 0;

  @override
  Day(String user_id, DateTime date) : super()
  {
    userId = user_id;
    startTime = new DateTime(date.year, date.month, date.day, startHour, startMinute);
    endTime = new DateTime(date.year, date.month, date.day, endHour, endMinute);

    DateTime iTime = startTime;
    increments = new List<Increment>();
    while (iTime.isBefore(endTime))
    {
      increments.add(new Increment(iTime));
      iTime = iTime.add(Increment.duration);
    }
  }

  @override
  Day.from(Day other) : super.from(other);

  @override
  Day.decode(Map<String, dynamic> d) : super.decode(d)
  {
    userId = d["user_id"];
    startTime = ModelBase.df.parse(d["start_time"]);
    endTime = ModelBase.df.parse(d["end_time"]);
    increments = new List<Increment>();

    // Parse any active increments
    List<Increment> activeIncrements = new List();
    if (d["active_increments"] != null)
    {
      List<Map<String, dynamic>> activeIncrementsData = d["active_increments"];
      if (activeIncrementsData != null)
      {
        for (Map<String, dynamic> incrementData in activeIncrementsData)
        {
          activeIncrements.add(new Increment.decode(incrementData));
        }
      }
    }

    // Create all increments and merge in active ones
    DateTime iTime = startTime;
    while (iTime.isBefore(endTime))
    {
      Increment inc = activeIncrements.firstWhere((i) => i.startTime.isAtSameMomentAs(iTime), orElse: () => null);
      if (inc == null) inc = new Increment(iTime);
      increments.add(inc);
      iTime = iTime.add(Increment.duration);
    }
  }

  @override
  Map<String, String> get encoded
  {
    Map<String, dynamic> d = super.encoded;
    Iterable<Increment> activeIncrements = increments.where((i) => i.state != null);
    d["active_increments"] = activeIncrements.map((increment) => increment.encoded).toList(growable: false);
    return d;
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["date"] = ModelBase.df.format(startTime);
    table["user_id"] = userId;
    return table;
  }

  bool isSameDateAs(DateTime dt)
  {
    DateTime start = increments.first.startTime;
    return (start.year == dt.year && start.month == dt.month && start.day == dt.day);
  }

  List<Increment> get increments => _data["increments"];
  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  String get userId => _data["user_id"];

  void set increments(List<Increment> value) { _data["increments"] = value; }
  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
}

class Increment
{
  static const Duration duration = const Duration(minutes: 10);

  Increment(DateTime start_time)
  {
    startTime = start_time;
    endTime = startTime.add(duration);
  }

  Increment.decode(Map<String, String> d)
  {
    startTime = ModelBase.df.parse(d["start_time"]);
    endTime = ModelBase.df.parse(d["end_time"]);
    state = d["state"];
    bookingId = d["booking_id"];
    roomId = d["room_id"];
  }

  Map<String, String> get encoded
  {
    Map<String, String> d = new Map();
    d["start_time"] = ModelBase.df.format(startTime);
    d["end_time"] = ModelBase.df.format(endTime);
    d["booking_id"] = bookingId;
    d["room_id"] = roomId;
    d["state"] = state;
    return d;
  }

  bool highlighted = false;
  Map<String, dynamic> _data = new Map();

  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  String get state => _data["state"];
  String get bookingId => _data["booking_id"];
  String get roomId => _data["room_id"];

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set state(String value) { _data["state"] = value; }
  void set bookingId(String value) { _data["booking_id"] = value; }
  void set roomId(String value) { _data["room_id"] = value; }
}