part of model_base;

class Service extends EditableModel
{
  @override
  Service([String id = null]) : super(id)
  {
    roomIds = new List();
    userIds = new List();
    serviceAddonIds = new List();
    price = 0;
    duration = const Duration(minutes: 1);
    afterMargin = const Duration(seconds: 0);
  }

  @override
  Service.from(Service other) : super.from(other);

  @override
  Service.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
    category = d["category"];
    description = d["description"];
    durationMinutes = d["duration_minutes"];
    afterMarginMinutes = d["after_margin_minutes"];
    price = (d["price"] is double) ? d["price"] : d["price"].toDouble();

    // TODO temporary while all services hasn't been updated
    color = (d.containsKey("color")) ? d["color"] : "green";

    roomIds = (d.containsKey("room_ids")) ? d["room_ids"] : new List();
    userIds = (d.containsKey("user_ids")) ? d["user_ids"] : new List();
    serviceAddonIds = (d.containsKey("service_addon_ids")) ? d["service_addon_ids"] : new List();
  }

  @override
  List<String> get tableColumns => super.tableColumns..addAll(["name", "category", "duration_minutes", "price"]);

  @override
  String toString() => name;

  String get name => data["name"];
  String get category => data["category"];
  String get description => data["description"];
  String get color => data["color"];
  Duration get duration => new Duration(minutes: durationMinutes);
  num get durationMinutes => data["duration_minutes"];
  String get durationMinutesStr => durationMinutes.toString();
  Duration get afterMargin => new Duration(minutes: afterMarginMinutes);
  num get afterMarginMinutes => data["after_margin_minutes"];
  String get afterMarginMinutesStr => afterMarginMinutes.toString();
  num get price => data["price"];
  String get priceStr => price.toString();
  List<String> get roomIds => data["room_ids"];
  List<String> get userIds => data["user_ids"];
  List<String> get serviceAddonIds => data["service_addon_ids"];

  void set category(String value) { data["category"] = value; }
  void set description(String value) { data["description"] = value; }
  void set name(String value) { data["name"] = value; }
  void set color(String value) { data["color"] = value; }
  void set duration(Duration value) { data["duration_minutes"] = value.inMinutes; }
  void set durationMinutes(num value) { data["duration_minutes"] = value?.toInt(); }
  void set durationMinutesStr(String value)
  {
    try { durationMinutes = num.parse(value); }
    on FormatException catch (e) { print(e.toString()); }
  }
  void set afterMargin(Duration value) { data["after_margin_minutes"] = value.inMinutes; }
  void set afterMarginMinutes(num value) { data["after_margin_minutes"] = value?.toInt(); }
  void set afterMarginMinutesStr(String value)
  {
    try { afterMarginMinutes = num.parse(value); }
    on FormatException catch (e) { print(e.toString()); }
  }
  void set price(num value) { data["price"] = value?.toDouble(); }
  void set priceStr(String value)
  {
    try { price = num.parse(value); }
    on FormatException catch (e) { print(e.toString()); }
  }
  void set roomIds(List<String> value) { data["room_ids"] = value; }
  void set userIds(List<String> value) { data["user_ids"] = value; }
  void set serviceAddonIds(List<String> value) { data["service_addon_ids"] = value; }
}
