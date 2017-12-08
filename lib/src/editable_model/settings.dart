part of model_base;

@Serializable()
class Settings extends _$SettingsSerializable implements FoModel
{
  /**
   * Score/Product Registry
   */
  List<List<ProductRoutinePair>> spr = new List();

  int latest_cancel_booking_hours_before = 24;

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;
}

class ProductRoutinePair
{
  ProductRoutinePair(this.product_id, this.product_routine_id);
  ProductRoutinePair.decode(Map<String, String> data) : product_id = data["product_id"], product_routine_id = data["product_routine_id"];

  Map<String, String> get encoded => {product_id : product_routine_id};


  final String product_id;
  String product_routine_id;
}