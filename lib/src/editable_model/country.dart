part of model_base;

class Country extends EditableModel
{
  @override
  Country(String id, name, String iso_alpha2) : super(id)
  {
    this.name = name;
    this.isoAlpha2 = iso_alpha2;
  }

  @override
  Country.from(Country other) : super.from(other);

  @override
  Country.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    name = d["name"];
    isoAlpha2 = d["iso_alpha2"];
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["iso_alpha2"] = isoAlpha2;
    return table;
  }

  @override
  String toString() => "$name ($isoAlpha2)";

  String get isoAlpha2 => _data["iso_alpha2"];
  String get name => _data["name"];

  void set isoAlpha2(String value) { _data["iso_alpha2"] = value; }
  void set name(String value) { _data["name"] = value; }
}
