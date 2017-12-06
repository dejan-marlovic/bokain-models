part of model_base;

@Serializable()
class Booking extends _$BookingSerializable implements FoModel
{
  DateTime start_time;
  DateTime end_time;
  Duration duration;
  String customer_id;
  String service_id;
  String user_id;
  String room_id;
  String salon_id;
  String day_id;
  List<String> service_addon_ids = new List();
  bool noshow;
  bool invoice_sent;
  String comments;
  num total_duration;
  num total_price;
  String cancel_code;

  String added_by;
  DateTime created;
  String id;
  String status;
}