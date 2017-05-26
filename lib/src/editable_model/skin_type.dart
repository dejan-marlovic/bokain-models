part of model_base;

class SkinType extends EditableModel
{
  @override
  SkinType(String id, String name) : super(id)
  {
    this.name = name;
  }

  @override
  SkinType.from(SkinType other) : super.from(other);

  @override
  SkinType.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["name"])] = name;
    return table;
  }

  @override
  String toString() => name;

  String get name => _data["name"];
  void set name(String value) { _data["name"] = value; }
}
