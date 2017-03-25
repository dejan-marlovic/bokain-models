part of model_base;

class Booking extends ModelBase
{
  Booking.empty()
  {
  }

  @override
  Booking(DateTime start_time, DateTime end_time, String customer_id, String service_id, List<String> service_addon_ids,
          String user_id, String salon_id, String room_id) : super()
  {
    startTime = start_time;
    endTime = end_time;
    duration = endTime.difference(startTime);
    customerId = customer_id;
    serviceId = service_id;
    serviceAddonIds = service_addon_ids;
    userId = user_id;
    salonId = salon_id;
    roomId = room_id;
  }

  @override
  Booking.from(Booking other) : super.from(other);

  @override
  Booking.decode(Map<String, dynamic> d) : super.decode(d)
  {
    startTime = ModelBase.df.parse(d["start_time"]);
    endTime = ModelBase.df.parse(d["end_time"]);
    duration = endTime.difference(startTime);
    customerId = d["customer_id"];
    serviceId = d["service_id"];
    userId = d["user_id"];
    roomId = d["room_id"];
    salonId = d["salon_id"];
    serviceAddonIds = d["service_addon_ids"];
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["start_time"] = ModelBase.df.format(startTime);
    table["duration_minutes"] = duration.inMinutes.toString();
    table["customer_id"] = customerId;
    table["user_id"] = userId;
    table["salon_id"] = salonId;
    return table;
  }

  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  Duration get duration => _data["duration"];
  String get customerId => _data["customer_id"];
  String get serviceId => _data["service_id"];
  String get userId => _data["user_id"];
  String get roomId => _data["room_id"];
  String get salonId => _data["salon_id"];
  List<String> get serviceAddonIds => _data["service_addon_ids"];

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set duration(Duration value) { _data["duration"] = value; }
  void set customerId(String value) { _data["customer_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set roomId(String value) { _data["room_id"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceAddonIds(List<String> value) { _data["service_addon_ids"] = value; }
}