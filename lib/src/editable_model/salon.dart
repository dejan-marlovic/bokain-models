part of model_base;

class Salon extends EditableModel
{
  @override
  Salon() : super()
  {
    roomIds = new List();
    userIds = new List();
    bookingIds = new List();
  }

  @override
  Salon.from(Salon other) : super.from(other);

  @override
  Salon.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    for (String key in d.keys)
    {
      _data[key] = d[key];
    }
    if (roomIds == null) roomIds = new List();
    if (userIds == null) userIds = new List();
    if (bookingIds == null) bookingIds = new List();
  }

  @override
  String toString() => name;

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["name"])] = name;
    table[ModelBase.phrase.get(["email"])] = email;
    table[ModelBase.phrase.get(["phone"])] = phone;
    table[ModelBase.phrase.get(["city"])] = city;
    return table;
  }

  String get name => _data["name"];
  String get email => _data["email"];
  String get phone => _data["phone"];
  String get street => _data["street"];
  String get postalCode => _data["postal_code"];
  String get city => _data["city"];
  List<String> get roomIds => _data["room_ids"];
  List<String> get userIds => _data["user_ids"];
  List<String> get bookingIds => _data["booking_ids"];

  void set name(String value) { _data["name"] = value; }
  void set email(String value) { _data["email"] = value; }
  void set phone(String value) { _data["phone"] = value; }
  void set street(String value) { _data["street"] = value; }
  void set postalCode(String value) { _data["postal_code"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set roomIds(List<String> value) { _data["room_ids"] = value; }
  void set userIds(List<String> value) { _data["user_ids"] = value; }
  void set bookingIds(List<String> value) { _data["booking_ids"] = value; }
}