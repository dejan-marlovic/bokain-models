part of model_base;

class Service extends EditableModel
{
  @override
  Service() : super()
  {
    serviceAddonIds = new List();
  }

  @override
  Service.from(Service other) : super.from(other);

  @override
  Service.fromData(Map<String, dynamic> d) : super.fromData(d);

  @override
  Service.decode(Map<String, dynamic> d) : super.decode(d)
  {
    name = d["name"];
    category = d["category"];
    description = d["description"];
    durationMinutes = d["duration_minutes"];
    price = d["price"];
    roomIds = d["room_ids"];
    serviceAddonIds = d["service_addon_ids"];
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["category"] = category;
    table["duration_minutes"] = durationMinutes.toString();
    table["price"] = price.toString();
    return table;
  }

  String get name => _data["name"];
  String get category => _data["category"];
  String get description => _data["description"];
  int get durationMinutes => _data["duration_minutes"];
  double get price => _data["price"];
  List<String> get roomIds => _data["room_ids"];
  List<String> get serviceAddonIds => _data["service_addon_ids"];

  void set category(String value) { _data["category"] = value; }
  void set description(String value) { _data["description"] = value; }
  void set name(String value) { _data["name"] = value; }
  void set durationMinutes(int value) { _data["duration_minutes"] = value; }
  void set price(double value) { _data["price"] = value; }
  void set roomIds(List<String> value) { _data["room_ids"] = value; }
  void set serviceAddonIds(List<String> value) { _data["service_addon_ids"] = value; }
}