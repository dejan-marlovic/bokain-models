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
  List<String> get tableColumns => super.tableColumns..addAll(["name", "type", "grade"]);

  @override
  String toString() => name;

  String get name => data["name"];
  FoModel get type => data["type"];
  FoModel get grade => data["grade"];

  void set name(String value) { data["name"] = value; }
  void set type(FoModel value) { data["type"] = value; }
  void set grade(FoModel value) { data["grade"] = value; }
}

class IngredientPhrases
{
  IngredientPhrases() : data = new Map()
  {
    benefits = new List();
    effects = new List();
    sideEffects = new List();
  }

  IngredientPhrases.decode(this.data)
  {
    if (data == null) data = new Map();

    if (benefits == null) benefits = new List();
    if (effects == null) effects = new List();
    if (sideEffects == null) sideEffects = new List();
  }

  String get name => data["name"];
  String get nameINCI => data["name_inci"];
  String get category => data["category"];
  List<String> get benefits => data["benefits"];
  List<String> get effects => data["effects"];
  List<String> get sideEffects => data["side_effects"];
  String get origin => data["origin"];
  String get trivia => data["trivia"];

  void set name(String value) { data["name"] = value; }
  void set nameINCI(String value) { data["name_inci"] = value; }
  void set category(String value) { data["category"] = value; }
  void set benefits(List<String> value) { data["benefits"] = value; }
  void set effects(List<String> value) { data["effects"] = value; }
  void set sideEffects(List<String> value) { data["side_effects"] = value; }
  void set origin(String value) { data["origin"] = value; }
  void set trivia(String value) { data["trivia"] = value; }

  Map<String, dynamic> data;
}