part of model_base;

class Room extends EditableModel
{
  @override
  Room() : super()
  {
    serviceIds = new List();
  }

  @override
  Room.from(Room other) : super.from(other);

  @override
  Room.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    for (String key in d.keys)
    {
      _data[key] = d[key];
    }
    if (serviceIds == null) serviceIds = new List();
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["name"])] = name;
    return table;
  }

  String toString() => name;

  String get name => _data["name"];
  List<String> get serviceIds => _data["service_ids"];

  void set name(String value) { _data["name"] = value; }
  void set serviceIds(List<String> value) { _data["service_ids"] = value; }
}