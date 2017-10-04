part of model_base;

class Ingredient extends EditableModel
{
  @override
  Ingredient([String id = null]) : super(id);

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> output = super.encoded;
    output["type"] = type.toString();
    output["grade"] = grade.toString();
    return output;
  }

  @override
  Ingredient.decode(String id, Map<String, dynamic> data) : super.decode(id, data)
  {
    name = data["name"];
    type = new FoModel(data["type"]);
    grade = new FoModel(data["grade"]);
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["type"] = type.toString();
    table["grade"] = grade.toString();
    return table;
  }

  @override
  String toString() => name;

  String get name => _data["name"];
  FoModel get type => _data["type"];
  FoModel get grade => _data["grade"];

  void set name(String value) { _data["name"] = value; }
  void set type(FoModel value) { _data["type"] = value; }
  void set grade(FoModel value) { _data["grade"] = value; }
}

class IngredientPhrases
{
  IngredientPhrases() : _data = new Map()
  {
    benefits = new List();
    effects = new List();
    sideEffects = new List();
  }

  IngredientPhrases.decode(this._data)
  {
    if (_data == null) _data = new Map();

    if (benefits == null) benefits = new List();
    if (effects == null) effects = new List();
    if (sideEffects == null) sideEffects = new List();
  }

  Map<String, String> get data => _data;

  String get name => _data["name"];
  String get nameINCI => _data["name_inci"];
  String get category => _data["category"];
  List<String> get benefits => _data["benefits"];
  List<String> get effects => _data["effects"];
  List<String> get sideEffects => _data["side_effects"];
  String get origin => _data["origin"];
  String get trivia => _data["trivia"];

  void set name(String value) { _data["name"] = value; }
  void set nameINCI(String value) { _data["name_inci"] = value; }
  void set category(String value) { _data["category"] = value; }
  void set benefits(List<String> value) { _data["benefits"] = value; }
  void set effects(List<String> value) { _data["effects"] = value; }
  void set sideEffects(List<String> value) { _data["side_effects"] = value; }
  void set origin(String value) { _data["origin"] = value; }
  void set trivia(String value) { _data["trivia"] = value; }

  Map<String, dynamic> _data;
}