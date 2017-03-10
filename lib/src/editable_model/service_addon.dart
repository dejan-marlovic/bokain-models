part of model_base;

class ServiceAddon extends EditableModel
{
  @override
  ServiceAddon() : super();

  @override
  ServiceAddon.from(ServiceAddon other) : super.from(other);

  @override
  ServiceAddon.decode(Map<String, dynamic> d) : super.decode(d)
  {
    name = d["name"];
    category = d["category"];
    description = d["description"];
    durationMinutes = d["duration_minutes"];
    price = d["price"];
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["category"] = category;
    table["duration_minutes"] = durationMinutes.toString();
    table["price"] = price.toString();
    return table;
  }

  String get name => _data["name"];
  String get category => _data["category"];
  String get description => _data["description"];
  int get durationMinutes => _data["duration_minutes"];
  double get price => _data["price"];

  void set name(String value) { _data["name"] = value; }
  void set category(String value) { _data["category"] = value; }
  void set description(String value) { _data["description"] = value; }
  void set durationMinutes(int value) { _data["duration_minutes"] = value; }
  void set price(double value) { _data["price"] = value; }
}