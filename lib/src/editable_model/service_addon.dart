part of model_base;

@Serializable()
class ServiceAddon extends _$ServiceAddonSerializable implements FoModel
{
  String description;
  String name;
  num price;
  Duration duration;
  List<String> service_ids = new List();

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;

  @override String toString() => name;
}