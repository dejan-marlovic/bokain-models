part of firebase_service;

@Injectable()
class IngredientService extends FirebaseServiceBase<Ingredient>
{
  IngredientService() : super("ingredients");

  @override
  Ingredient createModelInstance(Map<String, dynamic> data)
  {
    Ingredient model = new Ingredient();
    if (data != null) model.addAll(data);
    return model;
  }

  @override
  Map<String, dynamic> _serialize(Ingredient model)
  {
    Map<String, dynamic> data = super._serialize(model);
    data["type"] = model.type.id;
    data["grade"] = model.grade.id;
    return data;
  }

  @override
  Ingredient _deserialize(Map<String, dynamic> data)
  {
    try
    {
      data["type"] = new SimpleModel(data["type"], data["type"]);
      data["grade"] = new SimpleModel(data["grade"], data["grade"]);
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