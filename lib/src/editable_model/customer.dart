part of model_base;

@Serializable()
class Customer extends _$CustomerSerializable implements FoModel
{
  Customer()
  {
    Random rnd = new Random.secure();
    List<int> codeUnits = new List();
    for (int i = 0; i < 6; i++)
    {
      codeUnits.add(rnd.nextInt(30)+97);
    }
    password = new String.fromCharCodes(codeUnits);
  }

  int age;
  String belongs_to;
  String care_of;
  String comments_external;
  String comments_internal;
  String consultationId;
  String city;
  String country = "1";
  String email;
  String emailShop;
  String firstname;
  String lastname;
  String phone;
  String postal_code;
  String language = "1";
  String social_number;
  String street;
  String password;
  String sex;

  List<String> booking_ids = new List();
  List<String> journal_entry_ids = new List();

  /**
   * Temp for importing
   */
  String afterImageUrl;
  String beforeImageUrl;
  String customerId;

  /**
   * FoModel fields
   */
  String id;
  DateTime created;
  String added_by;
  String status;

  @override
  String toString() => email;
}