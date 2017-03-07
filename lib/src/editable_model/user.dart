part of model_base;

class User extends EditableModel
{
  @override
  User() : super();

  @override
  User.from(User other) : super.from(other);

  @override
  User.fromData(Map<String, dynamic> d) : super.fromData(d);

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
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = "$firstname $lastname";
    table["email"] = email;
    table["phone"] = phone;
    table["social_number"] = socialNumber;
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
}