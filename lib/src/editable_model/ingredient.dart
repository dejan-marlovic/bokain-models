part of model_base;

@Serializable()
class Ingredient extends _$IngredientSerializable implements FoModel
{
  String name;
  SimpleModel type;
  SimpleModel grade;

  @override String toString() => name;

  @override String added_by;
  @override String status;
  @override DateTime created;
  @override String id;
}

@Serializable()
class IngredientPhrases extends _$IngredientPhrasesSerializable
{
  String name;
  String name_inci;
  String category;
  List<String> benefits = new List();
  List<String> effects = new List();
  List<String> sideEffects = new List();
  String origin;
  String trivia;
}