part of firebase_service;

@Injectable()
class ProductRoutineService extends FirebaseServiceBase<ProductRoutine>
{
  ProductRoutineService() : super("product_routines");

  @override
  ProductRoutine createModelInstance(Map<String, dynamic> data)
  {
    ProductRoutine model = new ProductRoutine();
    if (data != null) model.addAll(data);
    return model;
  }

  @override
  Map<String, dynamic> _serialize(ProductRoutine model)
  {
    Map<String, dynamic> data = super._serialize(model);
    data["startup_days"] = model.startupDays.map((sd) => sd.encoded).toList(growable: false);
    return data;
  }

  @override
  ProductRoutine _deserialize(Map<String, dynamic> data)
  {
    try
    {
      List<Map<String, dynamic>> startupDays = data["startup_days"];
      data["startup_days"] = startupDays.map((row) => new StartupDay.decode(row));
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