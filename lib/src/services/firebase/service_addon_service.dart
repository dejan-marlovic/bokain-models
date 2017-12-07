part of firebase_service;

@Injectable()
class ServiceAddonService extends FirebaseServiceBase<ServiceAddon>
{
  ServiceAddonService() : super("service_addons", [new UniqueField("service_addons_names", "name", true)]);

  @override
  ServiceAddon createModelInstance(Map<String, dynamic> data) => new ServiceAddon()..fromMap(data);

  Future patchServices(ServiceAddon service_addon) async
  {
    _loading = true;
    await _db.ref(_name).child(service_addon.id).child("service_ids").set(service_addon.service_ids);
    _loading = false;
  }

  @override
  Map<String, dynamic> _serialize(ServiceAddon model)
  {
    Map<String, dynamic> data = super._serialize(model);
    data["duration_minutes"] = model.duration.inMinutes;
    data.remove("duration");
    return data;
  }

  @override
  ServiceAddon _deserialize(Map<String, dynamic> data)
  {
    try
    {
      data["duration"] = new Duration(minutes: data["duration_minutes"]);
      data.remove("duration_minutes");

      data["price"] = (data["price"] as num).toDouble();

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