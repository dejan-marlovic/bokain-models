part of model_base;

@Serializable()
class User extends _$UserSerializable implements FoModel
{
  String profile_image_uri;
  String city;
  String email;
  String firstname;
  String lastname;
  String phone;
  String postal_code;
  String social_number;
  String street;
  String password;
  int booking_rank = 0;
  List<String> customer_ids = new List();
  List<String> salon_ids = new List();
  List<String> service_ids = new List();
  List<String> booking_ids = new List();

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;

  @override
  String toString() => "$firstname $lastname";
}