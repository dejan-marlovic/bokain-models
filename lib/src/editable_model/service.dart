part of model_base;

class Service extends EditableModel
{
  @override
  Service() : super()
  {
    serviceAddonIds = new List();
  }

  @override
  Service.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  Service.decode(Map<String, String> data) : super.decode(data)
  {
    name = data["name"];
    category = data["category"];
    description = data["description"];
    durationMinutes = int.parse(data["duration_minutes"]);
    price = double.parse(data["price"]);
    roomIds = JSON.decode(data["room_ids"]);
    serviceAddonIds = JSON.decode(data["service_addon_ids"]);
  }

  @override
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();
    data["room_ids"] = JSON.encode(roomIds);
    data["service_addon_ids"] = JSON.encode(serviceAddonIds);
    return data;
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