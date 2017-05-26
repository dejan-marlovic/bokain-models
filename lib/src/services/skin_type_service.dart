part of model_service;

@Injectable()
class SkinTypeService extends ModelService
{
  SkinTypeService() : super("skin_types");

  @override
  SkinType createModelInstance(String id, Map<String, dynamic> data)
  {
    return new SkinType.decode(id, data);
  }
}