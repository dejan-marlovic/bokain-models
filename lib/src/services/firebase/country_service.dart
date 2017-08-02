part of model_service;

@Injectable()
class CountryService extends FirebaseServiceBase
{
  CountryService() : super("countries");

  @override
  Country createModelInstance(String id, Map<String, dynamic> data)
  {
    return new Country.decode(id, data);
  }
}