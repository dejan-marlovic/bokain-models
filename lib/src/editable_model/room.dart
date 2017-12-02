part of model_base;

class Room extends EditableModel
{
  @override
  Room(String id) : super(id)
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
      data[key] = d[key];
    }
    if (serviceIds == null) serviceIds = new List();
  }

  String toString() => name;

  String get name => data["name"];
  List<String> get serviceIds => data["service_ids"];

  void set name(String value) { data["name"] = value; }
  void set serviceIds(List<String> value) { data["service_ids"] = value; }
}