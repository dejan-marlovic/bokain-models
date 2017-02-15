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
  Day.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  Day.decode(Map<String, String> data) : super.decode(data)
  {
    userId = data["user_id"];
    startTime = DateTime.parse(data["start_time"]);
    endTime = DateTime.parse(data["end_time"]);
    increments = new List<Increment>();

    // Parse active increments
    Iterable<Map<String, String>> activeIncrementsData = JSON.decode(data["activeIncrements"]);
    List<Increment> activeIncrements = new List();
    if (activeIncrementsData != null)
    {
      for (Map<String, dynamic> incrementData in activeIncrementsData)
      {
        activeIncrements.add(new Increment.decode(incrementData));
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
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();
    Iterable<Increment> activeIncrements = increments.where((i) => i.state != null);
    data["active_increments"] = JSON.encode(activeIncrements.map((increment) => increment.encode()));
    return data;
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
  }

  Increment.decode(Map<String, String> data)
  {
    _startTime = DateTime.parse(data["start_time"]);
    _endTime = _startTime.add(duration);
    state = data["state"];
    bookingId = data["booking_id"];
    roomId = data["room_id"];
  }

  Map<String, String> encode()
  {
    Map<String, dynamic> data = new Map();
    data["start_time"] = ModelBase.df.format(_startTime);
    data["end_time"] = ModelBase.df.format(_endTime);
    data["booking_id"] = bookingId;
    data["room_id"] = roomId;
    data["state"] = state;
    return data;
  }

  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;

  void set startTime(DateTime value)
  {
    _startTime = value;
    if (_endTime != null) _endTime = _startTime.add(duration);
  }

  void set endTime(DateTime value)
  {
    _endTime = value;
    if (_startTime != null) _startTime = _endTime.add(-duration);

  }

  DateTime _startTime;
  DateTime _endTime;
  String state;
  String bookingId;
  String roomId;

  bool highlighted = false;
}