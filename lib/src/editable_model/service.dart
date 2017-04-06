part of model_base;

class Service extends EditableModel
{
  @override
  Service() : super()
  {
    serviceAddons = new List();
    roomIds = new List();
    userIds = new List();
  }

  @override
  Service.from(Service other) : super.from(other);

  @override
  Service.decode(Map<String, dynamic> d) : super.decode(d)
  {
    name = d["name"];
    category = d["category"];
    description = d["description"];
    durationMinutes = (d["duration_minutes"] is double) ? d["duration_minutes"] : d["duration_minutes"].toDouble();
    price = (d["price"] is double) ? d["price"] : d["price"].toDouble();
    roomIds = (d.containsKey("room_ids")) ? d["room_ids"] : new List();
    userIds = (d.containsKey(["user_ids"])) ? d["user_ids"] : new List();
    serviceAddons = (d.containsKey("service_addons")) ? d["service_addons"] : new List();
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["name"])] = name;
    table[ModelBase.phrase.get(["category"])] = category;
    table[ModelBase.phrase.get(["duration_minutes"])] = durationMinutes.toString();
    table[ModelBase.phrase.get(["price"])] = price.toString();
    return table;
  }

  String get name => _data["name"];
  String get category => _data["category"];
  String get description => _data["description"];
  double get durationMinutes => _data["duration_minutes"];
  double get price => _data["price"];
  List<String> get roomIds => _data["room_ids"];
  List<String> get userIds => _data["user_ids"];
  List<Map<String, dynamic>> get serviceAddons => _data["service_addons"];

  void set category(String value) { _data["category"] = value; }
  void set description(String value) { _data["description"] = value; }
  void set name(String value) { _data["name"] = value; }
  void set durationMinutes(double value) { _data["duration_minutes"] = value; }
  void set price(double value) { _data["price"] = value; }
  void set roomIds(List<String> value) { _data["room_ids"] = value; }
  void set userIds(List<String> value) { _data["user_ids"] = value; }
  void set serviceAddons(List<Map<String, dynamic>> value) { _data["service_addons"] = value; }
}

class ServiceAddon
{
  ServiceAddon()
  {
    name = "";
    price = 0.0;
    duration = 0.0;
  }

  String get name => _data["name"];
  double get price => _data["price"];
  double get duration => _data["duration"];
  Map<String, dynamic> get data => _data;

  void set name(String value) { _data["name"] = value; }
  void set price(double value) { _data["price"] = value; }
  void set duration(double value) { _data["duration"] = value; }
  Map<String, dynamic> _data = new Map();
}