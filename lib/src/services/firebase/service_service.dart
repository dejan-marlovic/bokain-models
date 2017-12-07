part of firebase_service;

@Injectable()
class ServiceService extends FirebaseServiceBase<Service>
{
  ServiceService() : super("services", [new UniqueField("services_names", "name", true)]);

  @override
  Service createModelInstance(Map<String, dynamic> data)
  {
    Service model = new Service();
    if (data != null) model.addAll(data);
    return model;
  }

  Future patchUsers(Service service) async
  {
    _loading = true;
    await _db.ref(_name).child(service.id).child("user_ids").set(service.user_ids);
    _loading = false;
  }

  Future patchServiceAddons(Service service) async
  {
    _loading = true;
    await _db.ref(_name).child(service.id).child("service_addon_ids").set(service.service_addon_ids);
    _loading = false;
  }


  @override
  Map<String, dynamic> _serialize(Service model)
  {
    Map<String, dynamic> data = super._serialize(model);

    data["duration_minutes"] = model.duration.inMinutes;
    data.remove("duration");

    data["after_margin_minutes"] = model.after_margin.inMinutes;
    data.remove("after_margin");

    return data;
  }

  @override
  Service _deserialize(Map<String, dynamic> data)
  {
    try
    {
      data["duration"] = new Duration(minutes: data["duration_minutes"]);
      data.remove("duration_minutes");
      
      data["after_margin"] = new Duration(minutes: data["after_margin_minutes"]);
      data.remove("after_margin_minutes");

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