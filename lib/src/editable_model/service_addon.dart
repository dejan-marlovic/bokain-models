part of model_base;

class ServiceAddon extends EditableModel
{
  ServiceAddon(String name, num price, num duration_minutes)
  {
    this.name = name;
    this.price = price.toDouble();
    this.duration = duration_minutes.toInt();
  }

  @override
  ServiceAddon.empty()
  {
    name = "";
    price = 0.0;
    duration = 0;
  }

  @override
  ServiceAddon.from(ServiceAddon other) : super.from(other)
  {
    name = other.name;
    price = other.price;
    duration = other.duration;
    description = other.description;
  }

  @override
  ServiceAddon.decode(Map<String, dynamic> d) : super.decode(d)
  {
    name = d["name"];
    price = d["price"];
    duration = d["duration"];
    description = d["description"];
  }

  @override
  Map<String, String> get toTable
  {
    return {ModelBase.phrase.get(["name"]) : name, ModelBase.phrase.get(["duration"]) : duration.toString(), ModelBase.phrase.get(["price"]) : price.toString()};
  }

  String toString() => ModelBase.phrase.get(["_ui_name_service_addon"], params: {"name":name, "duration":duration.toString(), "price":price.toString()});

  String get description => _data["description"];
  String get name => _data["name"];
  num get price => _data["price"];
  num get duration => _data["duration"];

  void set description(String value) { _data["description"] = value; }
  void set name(String value) { _data["name"] = value; }
  void set price(num value) { _data["price"] = value.toDouble(); }
  void set duration(num value) { _data["duration"] = value.toInt(); }
}