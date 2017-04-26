part of model_base;

class Service extends EditableModel
{
  @override
  Service() : super()
  {
    roomIds = new List();
    userIds = new List();
    serviceAddonIds = new List();
  }

  @override
  Service.from(Service other) : super.from(other);

  @override
  Service.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
    category = d["category"];
    description = d["description"];
    durationMinutes = d["duration_minutes"];
    price = (d["price"] is double) ? d["price"] : d["price"].toDouble();
    roomIds = (d.containsKey("room_ids")) ? d["room_ids"] : new List();
    userIds = (d.containsKey("user_ids")) ? d["user_ids"] : new List();
    serviceAddonIds = (d.containsKey("service_addon_ids")) ? d["service_addon_ids"] : new List();
  }

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> d = super.encoded;
    return d;
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

  @override
  String toString() => name;

  String get name => _data["name"];
  String get category => _data["category"];
  String get description => _data["description"];
  Duration get duration => new Duration(minutes: durationMinutes);
  num get durationMinutes => _data["duration_minutes"];
  num get price => _data["price"];
  List<String> get roomIds => _data["room_ids"];
  List<String> get userIds => _data["user_ids"];
  List<String> get serviceAddonIds => _data["service_addon_ids"];

  void set category(String value) { _data["category"] = value; }
  void set description(String value) { _data["description"] = value; }
  void set name(String value) { _data["name"] = value; }
  void set duration(Duration value) { _data["duration_minutes"] = value.inMinutes; }
  void set durationMinutes(num value) { data["duration_minutes"] = value.toInt(); }
  void set price(num value) { _data["price"] = value.toDouble(); }
  void set roomIds(List<String> value) { _data["room_ids"] = value; }
  void set userIds(List<String> value) { _data["user_ids"] = value; }
  void set serviceAddonIds(List<String> value) { _data["service_addon_ids"] = value; }
}
