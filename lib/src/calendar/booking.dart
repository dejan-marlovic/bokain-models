part of model_base;

class Booking extends ModelBase
{
  @override
  Booking([String id = null]) : super(id)
  {
    serviceAddonIds = new List();
    noshow = false;
    invoiceSent = false;
  }

  @override
  Booking.from(Booking other) : super.from(other);

  @override
  Booking.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    startTime = DateTime.parse(d["start_time"]);
    endTime = DateTime.parse(d["end_time"]);
    duration = endTime.difference(startTime);
    customerId = d["customer_id"];
    userId = d["user_id"];
    roomId = d["room_id"];
    salonId = d["salon_id"];
    dayId = d["day_id"];
    serviceId = d["service_id"];
    serviceAddonIds = d["service_addon_ids"];
    addedBy = d["added_by"];
    noshow = d.containsKey("noshow") ? d["noshow"] : false;
    invoiceSent = d.containsKey("invoice_sent") ? d["invoice_sent"] : false;
    comments = d["comments"];
    totalDuration = d["total_duration"];
    totalPrice = d["total_price"];
    cancelCode = d["cancel_code"];
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["start_time"] = ModelBase.timestampFormat(startTime);
    table["duration_minutes"] = duration.inMinutes.toString();
    table["customer_id"] = customerId;
    table["user_id"] = userId;
    table["salon_id"] = salonId;
    table["noshow"] = noshow.toString();
    return table;
  }

  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  String get strStartTime => ModelBase.timestampFormat(startTime);
  String get strEndTime => ModelBase.timestampFormat(endTime);
  Duration get duration => _data["duration"];
  String get customerId => _data["customer_id"];
  String get serviceId => _data["service_id"];
  String get userId => _data["user_id"];
  String get roomId => _data["room_id"];
  String get salonId => _data["salon_id"];
  String get dayId => _data["day_id"];
  List<String> get serviceAddonIds => _data["service_addon_ids"];
  String get addedBy => _data["added_by"];
  bool get noshow => _data["noshow"];
  bool get invoiceSent => _data["invoice_sent"];
  String get comments => _data["comments"];
  num get totalDuration => _data["total_duration"];
  num get totalPrice => _data["total_price"];
  String get cancelCode => _data["cancel_code"];

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set duration(Duration value) { _data["duration"] = value; }
  void set customerId(String value) { _data["customer_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set roomId(String value) { _data["room_id"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set dayId(String value) { _data["day_id"] = value; }
  void set serviceAddonIds(List<String> value) { _data["service_addon_ids"] = value; }
  void set addedBy(String value) { _data["added_by"] = value; }
  void set noshow(bool value) { _data["noshow"] = value; }
  void set invoiceSent(bool value) { _data["invoice_sent"] = value; }
  void set comments(String value) { _data["comments"] = value; }
  void set totalDuration(num value) { _data["total_duration"] = value; }
  void set totalPrice(num value) { _data["total_price"] = value; }
  void set cancelCode(String value) { _data["cancel_code"] = value; }
}