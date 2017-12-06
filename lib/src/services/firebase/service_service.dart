part of firebase_service;

@Injectable()
class ServiceService extends FirebaseServiceBase<Service>
{
  ServiceService() : super("services", [new UniqueField("services_names", "name", true)]);

  @override
  Service createModelInstance(String id, Map<String, dynamic> data) => data == null ? new Service(id) : new Service.decode(id, data);

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
}