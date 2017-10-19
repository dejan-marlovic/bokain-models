part of firebase_service;

@Injectable()
class DayService extends FirebaseServiceBase<Day>
{
  DayService() : super("days")
  {
    instance = instanceCounter;
    instanceCounter++;
  }

  Day _onChildAdded(String key, Map<String, dynamic> data)
  {
    return super._onChildAdded(key, data);
  }

  Day _onChildChanged(String key, Map<String, dynamic> data)
  {
    return super._onChildChanged(key, data);
  }

  String _onChildRemoved(String key)
  {
    return super._onChildRemoved(key);
  }

  int instance;

  @override
  Day createModelInstance(String id, Map<String, dynamic> data) => new Day.decode(id, data);

  static int instanceCounter = 0;
}