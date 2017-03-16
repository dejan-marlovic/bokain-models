part of model_base;

class Room extends EditableModel
{
  @override
  Room() : super()
  {
    serviceIds = new Set();
  }

  @override
  Room.from(Room other) : super.from(other);

  @override
  Room.decode(Map<String, dynamic> d) : super.decode(d)
  {
    _data = d;
    if (serviceIds == null) serviceIds = new Set();
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    return table;
  }

  String get name => _data["name"];
  Set<String> get serviceIds => _data["service_ids"];

  void set name(String value) { _data["name"] = value; }
  void set serviceIds(Set<String> value) { _data["service_ids"] = value; }
}