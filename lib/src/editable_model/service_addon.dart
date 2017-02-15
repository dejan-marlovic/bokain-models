part of model_base;

class ServiceAddon extends EditableModel
{
  @override
  ServiceAddon() : super();

  @override
  ServiceAddon.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  ServiceAddon.decode(Map<String, String> data) : super.decode(data)
  {
    name = data["name"];
    category = data["category"];
    description = data["description"];
    durationMinutes = int.parse(data["duration_minutes"]);
    price = double.parse(data["price"]);
  }

  @override
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();
    return data;
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