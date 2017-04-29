part of model_base;

class Day extends ModelBase
{
  static const int startHour = 8;
  static const int startMinute = 0;
  static const int endHour = 20;
  static const int endMinute = 0;

  @override
  Day(List<String> user_ids, String salon_id, DateTime date) : super()
  {
    salonId = salon_id;
    startTime = new DateTime(date.year, date.month, date.day, startHour, startMinute);
    endTime = new DateTime(date.year, date.month, date.day, endHour, endMinute);

    // Populate day with a full set of inactive increments for every user
    userIncrements = new Map<String, List<Increment>>();
    for (String user_id in user_ids)
    {
      DateTime iTime = startTime;
      while (iTime.isBefore(endTime))
      {
        userIncrements[user_id].add(new Increment(iTime));
        iTime = iTime.add(Increment.duration);
      }
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
    userIncrements = new Map<String, List<Increment>>();

    for (String user_id in d["user_increments"].keys)
    {
      userIncrements[user_id] = d["user_increments"][user_id].map((Map<String, dynamic> inc_data) => new Increment.decode(inc_data)).toList(growable: false);
    }
  }

  @override
  Map<String, String> get encoded
  {
    Map<String, dynamic> d = super.encoded;

    d["user_increments"] = new Map<String, Map<String, dynamic>>();
    for (String user_id in userIncrements.keys)
    {
      d["user_increments"][user_id] = userIncrements[user_id].map((increment) => increment.encoded).toList(growable: false);
    }
    return d;
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["date"])] = ModelBase.timestampFormat(startTime);
    table[ModelBase.phrase.get(["salon_id"])] = salonId;
    return table;
  }

  bool isSameDateAs(DateTime dt) => (startTime.year == dt.year && startTime.month == dt.month && startTime.day == dt.day);

  Map<String, List<Increment>> get userIncrements => _data["user_increments"];
  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  String get strStartTime => ModelBase.timestampFormat(startTime);
  String get strEndTime => ModelBase.timestampFormat(endTime);
  String get salonId => _data["salon_id"];

  void set userIncrements(Map<String, List<Increment>> value) { _data["user_increments"] = value; }
  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
}