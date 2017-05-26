part of model_base;

class Language extends EditableModel
{
  @override
  Language(String id, name, String iso_639_1) : super(id)
  {
    this.name = name;
    this.iso639_1 = iso_639_1;
  }

  @override
  Language.from(Language other) : super.from(other);

  @override
  Language.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
    iso639_1 = d["iso_639_1"];
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(["name"])] = ModelBase.phrase.get([name]);
    table[ModelBase.phrase.get(["iso_639_1"])] = iso639_1;
    return table;
  }

  @override
  String toString() => "${ModelBase.phrase.get([name])} ($iso639_1)";

  String get iso639_1 => _data["iso_639_1"];
  String get name => _data["name"];

  void set name(String value) { _data["name"] = value; }
  void set iso639_1(String value) { _data["iso_639_1"] = value; }
}
