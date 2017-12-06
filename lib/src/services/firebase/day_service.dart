part of firebase_service;

@Injectable()
class DayService extends FirebaseServiceBase<Day>
{
  DayService() : super("days");

  @override
  Day createModelInstance(Map<String, dynamic> data) => new Day()..fromMap(data);

  @override
  Map<String, dynamic> _serialize(Day model)
  {
    Map<String, dynamic> data = super._serialize(model);
    data["increments"] = model.increments.map((i) => i.encoded).toList(growable: false);
    return data;
  }

  @override
  Day _deserialize(Map<String, dynamic> data)
  {
    try
    {
      List<Map<String, dynamic>> increments = data["increments"];
      data["increments"] = increments.map((row) => new Increment.decode(row)).toList(growable: false);
      return super._deserialize(data);
    }
    catch (e, s)
    {
      print(e);
      print(s);
      return null;
    }
  }
}