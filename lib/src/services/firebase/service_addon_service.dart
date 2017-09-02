part of model_service;

@Injectable()
class ServiceAddonService extends FirebaseServiceBase
{
  ServiceAddonService() : super("service_addons");

  @override
  ServiceAddon createModelInstance(String id, Map<String, dynamic> data) => new ServiceAddon.decode(id, data);

  Future patchServices(ServiceAddon service_addon) async
  {
    _loading = true;
    await _db.ref(_name).child(service_addon.id).child("service_ids").set(service_addon.serviceIds);
    _loading = false;
  }
}