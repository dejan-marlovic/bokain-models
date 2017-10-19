part of firebase_service;

@Injectable()
class IngredientService extends FirebaseServiceBase<Ingredient>
{
  IngredientService() : super("ingredients"); /*1, [new UniqueField("products_article_nos", "article_no", true), new UniqueField("products_url_names", "url_name", true)]*/

  @override
  Ingredient createModelInstance(String id, Map<String, dynamic> data) => data == null ? new Ingredient(id) : new Ingredient.decode(id, data);
}