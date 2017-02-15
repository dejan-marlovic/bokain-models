part of model_base;

class Booking extends ModelBase
{
  @override
  Booking(DateTime start_time, DateTime end_time, String customer_id, String service_id, List<String> service_addon_ids,
          String user_id, String room_id) : super()
  {
    startTime = start_time;
    endTime = end_time;
    duration = endTime.difference(startTime);
    customerId = customer_id;
    serviceId = service_id;
    serviceAddonIds = service_addon_ids;
    userId = user_id;
    roomId = room_id;
  }

  @override
  Booking.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  Booking.decode(Map<String, String> data) : super.decode(data)
  {
    startTime = DateTime.parse(data["start_time"]);
    endTime = DateTime.parse(data["end_time"]);
    duration = endTime.difference(startTime);
    customerId = data["customer_id"];
    serviceId = data["service_id"];
    userId = data["user_id"];
    roomId = data["room_id"];
    serviceAddonIds = JSON.decode(data["service_addon_ids"]);
  }

  @override
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();
    data["service_addon_ids"] = JSON.encode(serviceAddonIds);
    return data;
  }

  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  Duration get duration => _data["duration"];
  String get customerId => _data["customer_id"];
  String get serviceId => _data["service_id"];
  String get userId => _data["user_id"];
  String get roomId => _data["room_id"];
  List<String> get serviceAddonIds => _data["service_addon_ids"];

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set duration(Duration value) { _data["duration"] = value; }
  void set customerId(String value) { _data["customer_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set roomId(String value) { _data["room_id"] = value; }
  void set serviceAddonIds(List<String> value) { _data["service_addon_ids"] = value; }
}