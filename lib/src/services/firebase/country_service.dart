part of firebase_service;

@Injectable()
class CountryService extends FirebaseServiceBase
{
  CountryService() : super("countries");

  @override
  Country createModelInstance(String id, Map<String, dynamic> data) => new Country.decode(id, data);
}