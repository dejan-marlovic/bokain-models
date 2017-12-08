part of model_base;

@Serializable()
class ProductRoutine extends _$ProductRoutineSerializable implements FoModel
{
  String name;
  String product_id;
  String state = "daily";
  String daily_routine_morning;
  String daily_routine_mid_day;
  String daily_routine_evening;
  String weekly_routine;
  int day_step = 1;

  List<StartupDay> startupDays = new List.generate(28, (i) => new StartupDay());

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;

  @override
  String toString() => name;
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

  int get durationMinutes => duration == null ? 0 : duration.inMinutes;
  void set durationMinutes(int value) { duration = new Duration(minutes: value); }

  bool active = false;
  bool night;
  Duration duration;
}