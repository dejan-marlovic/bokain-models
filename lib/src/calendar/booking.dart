part of model_base;

class Booking extends ModelBase
{
  @override
  Booking() : super()
  {
    serviceAddonIds = new List();
  }

  @override
  Booking.from(Booking other) : super.from(other);

  @override
  Booking.decode(Map<String, dynamic> d) : super.decode(d)
  {
    startTime = DateTime.parse(d["start_time"]);
    endTime = DateTime.parse(d["end_time"]);
    duration = endTime.difference(startTime);
    price = d["price"];
    customerId = d["customer_id"];
    serviceId = d["service_id"];
    userId = d["user_id"];
    roomId = d["room_id"];
    salonId = d["salon_id"];
    serviceAddonIds = d["service_addon_ids"];
    addedBy = d["added_by"];
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["start_time"])] = ModelBase.timestampFormat(startTime);
    table[ModelBase.phrase.get(["duration_minutes"])] = duration.inMinutes.toString();
    table[ModelBase.phrase.get(["customer_id"])] = customerId;
    table[ModelBase.phrase.get(["user_id"])] = userId;
    table[ModelBase.phrase.get(["salon_id"])] = salonId;
    return table;
  }

  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  String get strStartTime => ModelBase.timestampFormat(startTime);
  String get strEndTime => ModelBase.timestampFormat(endTime);
  Duration get duration => _data["duration"];
  num get price => _data["price"];
  String get customerId => _data["customer_id"];
  String get serviceId => _data["service_id"];
  String get userId => _data["user_id"];
  String get roomId => _data["room_id"];
  String get salonId => _data["salon_id"];
  List<String> get serviceAddonIds => _data["service_addon_ids"];
  String get addedBy => _data["added_by"];

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set duration(Duration value) { _data["duration"] = value; }
  void set price(num value) { _data["price"] = value.toDouble(); }
  void set customerId(String value) { _data["customer_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set roomId(String value) { _data["room_id"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceAddonIds(List<String> value) { _data["service_addon_ids"] = value; }
  void set addedBy(String value) { _data["addded_by"] = value; }

  int progress = 0;
  int secondaryProgress = 0;
}