part of model_base;

class ServiceAddon extends EditableModel
{
  ServiceAddon([String id = null]) : super(id)
  {
    this.name = name;
    this.price = 0;
    this.durationMinutes = 1;
    serviceIds = new List();
  }

  @override
  ServiceAddon.from(ServiceAddon other) : super.from(other);

  @override
  ServiceAddon.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
    price = d["price"];
    durationMinutes = d["duration_minutes"];
    description = d["description"];
    serviceIds = (d.containsKey("service_ids")) ? d["service_ids"] : new List();
  }

  List<String> get tableColumns => super.tableColumns..addAll(["name", "duration_minues", "price"]);

  String toString() => name;

  String get description => data["description"];
  String get name => data["name"];
  num get price => data["price"];
  String get priceStr => price.toString();
  Duration get duration => new Duration(minutes: durationMinutes);
  num get durationMinutes => data["duration_minutes"];
  String get durationMinutesStr => durationMinutes.toString();
  List<String> get serviceIds => data["service_ids"];

  void set description(String value) { data["description"] = value; }
  void set name(String value) { data["name"] = value; }
  void set price(num value) { data["price"] = value.toDouble(); }
  void set priceStr(String value)
  {
    try { price = num.parse(value); }
    on FormatException catch (e) { print(e.toString()); }
  }
  void set duration(Duration value) { durationMinutes = value.inMinutes; }
  void set durationMinutes(num value) { data["duration_minutes"] = value.toInt(); }
  void set durationMinutesStr(String value)
  {
    try { durationMinutes = num.parse(value); }
    on FormatException catch (e) { print(e.toString()); }
  }
  void set serviceIds(List<String> value) { data["service_ids"] = value; }
}