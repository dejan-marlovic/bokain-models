part of model_service;

@Injectable()
class SkinTypeService extends FirebaseServiceBase
{
  SkinTypeService() : super("skin_types");

  @override
  SkinType createModelInstance(String id, Map<String, dynamic> data) => new SkinType.decode(id, data);
}