part of model_base;

@Serializable()
class Service extends _$ServiceSerializable implements FoModel
{
  String name;
  String category;
  String description;
  String color;
  Duration duration = const Duration(minutes: 1);
  Duration after_margin = const Duration(seconds: 0);
  num price;

  List<String> room_ids = new List();
  List<String> user_ids = new List();
  List<String> service_addon_ids = new List();

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;

  @override String toString() => name;
}
