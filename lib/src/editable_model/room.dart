part of model_base;

@Serializable()
class Room extends _$RoomSerializable implements FoModel
{
  String name;
  List<String> service_ids = new List();

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;

  @override
  String toString() => name;
}