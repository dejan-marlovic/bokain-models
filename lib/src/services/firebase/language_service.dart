part of model_service;

@Injectable()
class LanguageService extends FirebaseServiceBase
{
  LanguageService() : super("languages");

  @override
  Language createModelInstance(String id, Map<String, dynamic> data)
  {
    return new Language.decode(id, data);
  }
}