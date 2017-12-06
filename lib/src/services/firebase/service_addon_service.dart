part of firebase_service;

@Injectable()
class ServiceAddonService extends FirebaseServiceBase<ServiceAddon>
{
  ServiceAddonService() : super("service_addons", [new UniqueField("service_addons_names", "name", true)]);

  @override
  ServiceAddon createModelInstance(String id, Map<String, dynamic> data) => data == null ? new ServiceAddon(id) : new ServiceAddon.decode(id, data);

  Future patchServices(ServiceAddon service_addon) async
  {
    _loading = true;
    await _db.ref(_name).child(service_addon.id).child("service_ids").set(service_addon.service_ids);
    _loading = false;
  }
}