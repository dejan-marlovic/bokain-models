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

  List<String> get tableColumns => super.tableColumns..addAll(["firstname", "lastname", "email", "phone", "social_number", "customer_ids", "created"]);

  @override
  String toString() => "$firstname $lastname";

  String get profileImageUrl => data["profile_image_url"];
  String get city => data["city"];
  String get email => data["email"];
  String get firstname => data["firstname"];
  String get lastname => data["lastname"];
  String get phone => data["phone"];
  String get postalCode => data["postal_code"];
  String get socialNumber => data["social_number"];
  String get street => data["street"];
  String get password => data["password"];
  List<String> get customerIds => data["customer_ids"];
  List<String> get salonIds => data["salon_ids"];
  List<String> get serviceIds => data["service_ids"];
  List<String> get bookingIds => data["booking_ids"];
  num get bookingRank => data["booking_rank"];
  String get strBookingRank => bookingRank.toString();

  void set profileImageUrl(String value) { data["profile_image_url"] = value; }
  void set socialNumber(String value) { data["social_number"] = value; }
  void set firstname(String value) { data["firstname"] = value; }
  void set lastname(String value) { data["lastname"] = value; }
  void set password(String value) { data["password"] = value; }
  void set email(String value) { data["email"] = value; }
  void set phone(String value) { data["phone"] = value; }
  void set street(String value) { data["street"] = value; }
  void set postalCode(String value) { data["postal_code"] = value; }
  void set city(String value) { data["city"] = value; }
  void set customerIds(List<String> value) { data["customer_ids"] = value; }
  void set salonIds(List<String> value) { data["salon_ids"] = value; }
  void set serviceIds(List<String> value) { data["service_ids"] = value; }
  void set bookingIds(List<String> value) { data["booking_ids"] = value; }
  void set bookingRank(num value) { data["booking_rank"] = value.toInt(); }
  void set strBookingRank(String value)
  {
    try { bookingRank = int.parse(value); }
    on FormatException catch(e) { print(e.toString()); }
  }
}