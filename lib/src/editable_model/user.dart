part of model_base;

class User extends EditableModel
{
  @override
  User([String id = null]) : super(id)
  {
    customerIds = new List();
    salonIds = new List();
    serviceIds = new List();
    bookingIds = new List();

    bookingRank = 0;
  }

  @override
  User.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    profileImageUrl = d["profile_image_url"];
    socialNumber = d["social_number"];
    firstname = d["firstname"];
    lastname = d["lastname"];
    password = d["password"];
    email = d["email"];
    phone = d["phone"];
    street = d["street"];
    postalCode = d["postal_code"];
    city = d["city"];
    customerIds = d.containsKey("customer_ids") ? d["customer_ids"] : new List();
    salonIds = d.containsKey("salon_ids") ? d["salon_ids"] : new List();
    serviceIds = d.containsKey("service_ids") ? d["service_ids"] : new List();
    bookingIds = d.containsKey("booking_ids") ? bookingIds = d["booking_ids"] : new List();
    bookingRank = d.containsKey("booking_rank") ? d["booking_rank"] : 0;
  }

  @override
  User.from(User other) : super.from(other);

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["name"] = "$firstname $lastname";
    table["email"] = email;
    table["phone"] = phone;
    table["social_number"] = socialNumber;
    table["customer_plural"] = customerIds.length.toString();
    return table;
  }

  @override
  String toString() => "$firstname $lastname";

  String get profileImageUrl => _data["profile_image_url"];
  String get city => _data["city"];
  String get email => _data["email"];
  String get firstname => _data["firstname"];
  String get lastname => _data["lastname"];
  String get phone => _data["phone"];
  String get postalCode => _data["postal_code"];
  String get socialNumber => _data["social_number"];
  String get street => _data["street"];
  String get password => _data["password"];
  List<String> get customerIds => _data["customer_ids"];
  List<String> get salonIds => _data["salon_ids"];
  List<String> get serviceIds => _data["service_ids"];
  List<String> get bookingIds => _data["booking_ids"];
  num get bookingRank => _data["booking_rank"];
  String get strBookingRank => bookingRank.toString();

  void set profileImageUrl(String value) { _data["profile_image_url"] = value; }
  void set socialNumber(String value) { _data["social_number"] = value; }
  void set firstname(String value) { _data["firstname"] = value; }
  void set lastname(String value) { _data["lastname"] = value; }
  void set password(String value) { _data["password"] = value; }
  void set email(String value) { _data["email"] = value; }
  void set phone(String value) { _data["phone"] = value; }
  void set street(String value) { _data["street"] = value; }
  void set postalCode(String value) { _data["postal_code"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set customerIds(List<String> value) { _data["customer_ids"] = value; }
  void set salonIds(List<String> value) { _data["salon_ids"] = value; }
  void set serviceIds(List<String> value) { _data["service_ids"] = value; }
  void set bookingIds(List<String> value) { _data["booking_ids"] = value; }
  void set bookingRank(num value) { _data["booking_rank"] = value.toInt(); }
  void set strBookingRank(String value)
  {
    int v = 0;
    try { v = int.parse(value); } on FormatException catch(e) { print(e); }
    _data["booking_rank"] = v;
  }
}