part of model_base;

class Room extends EditableModel
{
  @override
  Room() : super()
  {
    serviceIds = new List();
  }

  @override
  Room.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  Room.decode(Map<String, String> data) : super.decode(data)
  {
    name = data["name"];
    salonId = data["salon_id"];
    serviceIds = JSON.decode(data["service_ids"]);
  }

  @override
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();
    data["service_ids"] = JSON.encode(serviceIds);
    return data;
  }

  String get name => _data["name"];
  String get salonId => _data["salon_id"];
  List<String> get serviceIds => _data["service_ids"];

  void set name(String value) { _data["name"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceIds(List<String> value) { _data["service_ids"] = value; }
}