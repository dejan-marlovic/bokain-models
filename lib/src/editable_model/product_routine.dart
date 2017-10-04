part of model_base;

class ProductRoutine extends EditableModel
{
  @override
  ProductRoutine([String id = null]) : super(id);

  @override
  ProductRoutine.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["created"] = ModelBase.timestampFormat(created);
    return table;
  }

  @override
  String toString() => name;

  String get name => _data["name"];
  String get weeklyDescription => _data["weekly_description"];

  void set name(String value) { _data["name"] = value; }
  void set weeklyDescription(String value) { _data["weekly_description"] = value; }
}
