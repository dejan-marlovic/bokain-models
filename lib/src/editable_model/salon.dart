part of model_base;

class Salon extends EditableModel
{
  @override
  Salon() : super()
  {
    roomIds = new List();
  }

  @override
  Salon.from(Salon other) : super.from(other);

  @override
  Salon.fromData(Map<String, dynamic> d) : super.fromData(d);

  @override
  Salon.decode(Map<String, dynamic> d) : super.decode(d)
  {
    roomIds = d["room_ids"];
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["email"] = email;
    table["phone"] = phone;
    table["city"] = city;
    return table;
  }

  String get name => _data["name"];
  String get email => _data["email"];
  String get phone => _data["phone"];
  String get street => _data["street"];
  String get postalCode => _data["postal_code"];
  String get city => _data["city"];
  List<String> get roomIds => _data["room_ids"];

  void set name(String value) { _data["name"] = value; }
  void set email(String value) { _data["email"] = value; }
  void set phone(String value) { _data["phone"] = value; }
  void set street(String value) { _data["street"] = value; }
  void set postalCode(String value) { _data["postal_code"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set roomIds(List<String> value) { _data["room_ids"] = value; }
}