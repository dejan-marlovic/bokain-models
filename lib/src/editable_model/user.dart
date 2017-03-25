part of model_base;

class User extends EditableModel
{
  @override
  User() : super()
  {
    customerIds = new List();
  }

  @override
  User.from(User other) : super.from(other);

  @override
  User.decode(Map<String, dynamic> d) : super.decode(d)
  {
    socialNumber = d["social_number"];
    firstname = d["firstname"];
    lastname = d["lastname"];
    password = d["password"];
    email = d["email"];
    phone = d["phone"];
    street = d["street"];
    postalCode = d["postal_code"];
    city = d["city"];
    country = d["country"];
    customerIds = d.containsKey("customer_ids") ? d["customer_ids"] : new List();
    salonIds = d.containsKey("salon_ids") ? d["salon_ids"] : new List();
    serviceIds = d.containsKey("service_ids") ? d["service_ids"] : new List();
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = "$firstname $lastname";
    table["email"] = email;
    table["phone"] = phone;
    table["social_number"] = socialNumber;
    table["customers"] = customerIds.length.toString();
    return table;
  }

  String get city => _data["city"];
  String get country => _data["country"];
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

  void set socialNumber(String value) { _data["social_number"] = value; }
  void set firstname(String value) { _data["firstname"] = value; }
  void set lastname(String value) { _data["lastname"] = value; }
  void set password(String value) { _data["password"] = value; }
  void set email(String value) { _data["email"] = value; }
  void set phone(String value) { _data["phone"] = value; }
  void set street(String value) { _data["street"] = value; }
  void set postalCode(String value) { _data["postal_code"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set country(String value) { _data["country"] = value; }
  void set customerIds(List<String> value) { _data["customer_ids"] = value; }
  void set salonIds(List<String> value) { _data["salon_ids"] = value; }
  void set serviceIds(List<String> value) { _data["service_ids"] = value; }
}