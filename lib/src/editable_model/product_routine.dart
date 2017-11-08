part of model_base;

class ProductRoutine extends EditableModel
{
  @override
  ProductRoutine([String id = null]) : super(id)
  {
    state = "daily";
    dayStep = 1;

    for (int i = 0; i < 28; i++)
    {
      startupDays[i] = new StartupDay();
    }
  }

  @override
  ProductRoutine.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
    productId = d["product_id"];
    state = d["state"];
    dailyRoutineMorning = d["daily_routine_morning"];
    dailyRoutineMidDay = d["daily_routine_mid_day"];
    dailyRoutineEvening = d["daily_routine_evening"];
    weeklyRoutine = d["weekly_routine"];
    dayStep = d["day_step"];

    List<Map<String, dynamic>> sd = d["startup_days"];

    if (d.containsKey("startup_days") && d["startup_days"].length == 28)
    {
      for (int i = 0; i < 28; i++)
      {
        startupDays[i] = new StartupDay.decode(sd[i]);
      }
    }
    else
    {
      for (int i = 0; i < 28; i++)
      {
        startupDays[i] = new StartupDay();
      }
    }
  }

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> output = super.encoded;
    output["startup_days"] = startupDays.map((d) => d.encoded).toList(growable: false);
    return output;
  }

  @override
  String toString() => name;

  String get name => _data["name"];
  String get productId => _data["product_id"];
  String get state => _data["state"]; // 'daily' / 'weekly'
  String get dailyRoutineMorning => _data["daily_routine_morning"];
  String get dailyRoutineMidDay => _data["daily_routine_mid_day"];
  String get dailyRoutineEvening => _data["daily_routine_evening"];
  String get weeklyRoutine => _data["weekly_routine"];
  int get dayStep => _data["day_step"];
  String get strDayStep => dayStep.toString();

  void set name(String value) { _data["name"] = value; }
  void set productId(String value) { _data["product_id"] = value; }
  void set state(String value) { _data["state"] = value; }
  void set dailyRoutineMorning(String value) { _data["daily_routine_morning"] = value; }
  void set dailyRoutineMidDay(String value) { _data["daily_routine_mid_day"] = value; }
  void set dailyRoutineEvening(String value) { _data["daily_routine_evening"] = value; }
  void set weeklyRoutine(String value) { _data["weekly_routine"] = value; }
  void set dayStep(int value) { _data["day_step"] = value; }
  void set strDayStep(String value) { try { dayStep = int.parse(value); } on FormatException catch(e, s) { print(e); print(s); } }
  List<StartupDay> startupDays = new List(28);
}

class StartupDay
{
  StartupDay();

  StartupDay.decode(Map<String, dynamic> data)
  {
    if (data.containsKey("duration_minutes")) duration = new Duration(minutes: data["duration_minutes"]);
    if (data.containsKey("night")) night = data["night"];
    if (data.containsKey("active")) active = data["active"];
  }

  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> output = new Map();
    output["active"] = active;
    if (night != null) output["night"] = night;
    if (duration != null) output["duration_minutes"] = duration.inMinutes;
    return output;
  }

//  String get strDurationMinutes => (duration == null) ? null : duration.inMinutes.toString();
//  void set strDurationMinutes(String value) { try { duration = new Duration(minutes: int.parse(value)); } on FormatException catch(e, s) { print(e); print(s); } }

  int get durationMinutes => duration == null ? 0 : duration.inMinutes;
  void set durationMinutes(int value) { duration = new Duration(minutes: value); }

  bool active = false;
  bool night;
  Duration duration;
}