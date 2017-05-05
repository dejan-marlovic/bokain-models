part of model_service;

@Injectable()
class ServiceAddonService extends ModelService
{
  ServiceAddonService() : super("service_addons");

  @override
  ServiceAddon createModelInstance(String id, Map<String, dynamic> data)
  {
    return new ServiceAddon.decode(id, data);
  }

  Future patchServices(ServiceAddon service_addon) async
  {
    _loading = true;
    await _ref.child(service_addon.id).child("service_ids").set(service_addon.serviceIds);
    _loading = false;
  }
}