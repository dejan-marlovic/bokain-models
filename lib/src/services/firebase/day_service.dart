part of firebase_service;

@Injectable()
class DayService extends FirebaseServiceBase
{
  DayService() : super("days");

  ModelBase _onChildAdded(String key, Map<String, dynamic> data)
  {
    print("ONCHILDADDED");
    return super._onChildAdded(key, data);
  }

  ModelBase _onChildChanged(String key, Map<String, dynamic> data)
  {
    print("ONCHILDCHANGED");
    return super._onChildChanged(key, data);
  }

  String _onChildRemoved(String key)
  {
    print("ONCHILDREMOVED");
    return super._onChildRemoved(key);
  }

  @override
  Day createModelInstance(String id, Map<String, dynamic> data) => new Day.decode(id, data);
}