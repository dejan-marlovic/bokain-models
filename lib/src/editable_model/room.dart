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
  Room.fromData(Map<String, dynamic> d) : super.fromData(d);

  @override
  Room.decode(Map<String, dynamic> d) : super.decode(d)
  {
    name = d["name"];
    salonId = d["salon_id"];
    serviceIds = d["service_ids"];
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["salon_id"] = salonId;
    return table;
  }

  String get name => _data["name"];
  String get salonId => _data["salon_id"];
  List<String> get serviceIds => _data["service_ids"];

  void set name(String value) { _data["name"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceIds(List<String> value) { _data["service_ids"] = value; }
}