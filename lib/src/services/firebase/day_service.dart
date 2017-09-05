part of firebase_service;

@Injectable()
class DayService extends FirebaseServiceBase
{
  DayService() : super("days");

  @override
  Day createModelInstance(String id, Map<String, dynamic> data) => new Day.decode(id, data);
}