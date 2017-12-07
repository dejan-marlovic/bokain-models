part of model_base;

@Serializable()
class Salon extends _$SalonSerializable implements FoModel
{
  String name;
  String email;
  String phone;
  String street;
  String postal_code;
  String city;

  /// One url per company
  Map<String, String> logo_uris = new Map();

  List<String> room_ids = new List();
  List<String> user_ids = new List();
  List<String> booking_ids = new List();

  @override
  String toString() => name;

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;
}