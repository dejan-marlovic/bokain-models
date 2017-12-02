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
  List<String> get tableColumns => ["start_time", "noshow", "invoice_sent"];

  DateTime get startTime => data["start_time"];
  DateTime get endTime => data["end_time"];
  String get strStartTime => ModelBase.timestampFormat(startTime);
  String get strEndTime => ModelBase.timestampFormat(endTime);
  Duration get duration => data["duration"];
  String get customerId => data["customer_id"];
  String get serviceId => data["service_id"];
  String get userId => data["user_id"];
  String get roomId => data["room_id"];
  String get salonId => data["salon_id"];
  String get dayId => data["day_id"];
  List<String> get serviceAddonIds => data["service_addon_ids"];
  String get addedBy => data["added_by"];
  bool get noshow => data["noshow"];
  bool get invoiceSent => data["invoice_sent"];
  String get comments => data["comments"];
  num get totalDuration => data["total_duration"];
  num get totalPrice => data["total_price"];
  String get cancelCode => data["cancel_code"];

  void set startTime(DateTime value) { data["start_time"] = value; }
  void set endTime(DateTime value) { data["end_time"] = value; }
  void set duration(Duration value) { data["duration"] = value; }
  void set customerId(String value) { data["customer_id"] = value; }
  void set serviceId(String value) { data["service_id"] = value; }
  void set userId(String value) { data["user_id"] = value; }
  void set roomId(String value) { data["room_id"] = value; }
  void set salonId(String value) { data["salon_id"] = value; }
  void set dayId(String value) { data["day_id"] = value; }
  void set serviceAddonIds(List<String> value) { data["service_addon_ids"] = value; }
  void set addedBy(String value) { data["added_by"] = value; }
  void set noshow(bool value) { data["noshow"] = value; }
  void set invoiceSent(bool value) { data["invoice_sent"] = value; }
  void set comments(String value) { data["comments"] = value; }
  void set totalDuration(num value) { data["total_duration"] = value; }
  void set totalPrice(num value) { data["total_price"] = value; }
  void set cancelCode(String value) { data["cancel_code"] = value; }
}