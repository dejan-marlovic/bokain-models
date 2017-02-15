part of model_base;

class User extends EditableModel
{
  @override
  User() : super();

  @override
  User.fromData(Map<String, dynamic> data) : super.fromData(data)
  {
  }

  @override
  User.decode(Map<String, String> data) : super.decode(data)
  {
    socialNumber = data["social_number"];
    firstname = data["firstname"];
    lastname = data["lastname"];
    password = data["password"];
    email = data["email"];
    phone = data["phone"];
    street = data["street"];
    postalCode = data["postal_code"];
    city = data["city"];
    country = data["country"];
  }

  @override
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();
    return data;
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