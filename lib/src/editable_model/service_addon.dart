part of model_base;

class ServiceAddon extends EditableModel
{
  ServiceAddon(String name, num price, num duration_minutes)
  {
    this.name = name;
    this.price = price.toDouble();
    this.durationMinutes = duration_minutes.toInt();
    serviceIds = new List();
  }

  /*
  @override
  ServiceAddon.empty()
  {
    name = "";
    price = 0.0;
    durationMinutes = 0;
    serviceIds = new List();
  }
*/
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

  @override
  Map<String, String> get toTable
  {
    return {ModelBase.phrase.get(["name"]) : name, ModelBase.phrase.get(["duration"]) : durationMinutes.toString(), ModelBase.phrase.get(["price"]) : price.toString()};
  }

  String toString() => ModelBase.phrase.get(["_ui_name_service_addon"], params: {"name":name, "duration":durationMinutes.toString(), "price":price.toString()});

  String get description => _data["description"];
  String get name => _data["name"];
  num get price => _data["price"];
  Duration get duration => new Duration(minutes: durationMinutes);
  num get durationMinutes => _data["duration_minutes"];
  List<String> get serviceIds => _data["service_ids"];

  void set description(String value) { _data["description"] = value; }
  void set name(String value) { _data["name"] = value; }
  void set price(num value) { _data["price"] = value.toDouble(); }
  void set duration(Duration value) { durationMinutes = value.inMinutes; }
  void set durationMinutes(num value) { _data["duration_minutes"] = value.toInt(); }
  void set serviceIds(List<String> value) { _data["service_ids"] = value; }
}