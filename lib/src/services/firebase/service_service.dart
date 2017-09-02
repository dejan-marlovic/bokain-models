part of model_service;

@Injectable()
class ServiceService extends FirebaseServiceBase
{
  ServiceService() : super("services");

  @override
  Service createModelInstance(String id, Map<String, dynamic> data) => new Service.decode(id, data);

  Future patchUsers(Service service) async
  {
    _loading = true;
    await _db.ref(_name).child(service.id).child("user_ids").set(service.userIds);
    _loading = false;
  }

  Future patchServiceAddons(Service service) async
  {
    _loading = true;
    await _db.ref(_name).child(service.id).child("service_addon_ids").set(service.serviceAddonIds);
    _loading = false;
  }
}