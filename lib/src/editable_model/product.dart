part of model_base;

@Serializable()
class Product extends _$ProductSerializable implements FoModel
{
  List<String> ingredient_ids = new List();
  List<String> related_product_ids = new List();
  List<String> sub_product_ids = new List();
  List<String> product_routine_ids = new List();

  String name;
  String article_no;
  int buy_price_sek;
  String image_uri;
  num price_eur = 0;
  num price_sek = 0;
  num price_usd = 0;
  String product_category_id;
  int search_rank;
  int score;
  int stock;
  String type = "standard";
  String url_name;
  int vat = 25;
  int volume;
  int weight;

  @override
  String toString() => name;

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;
}

@Serializable()
class ProductPhrases extends _$ProductPhrasesSerializable
{
  String name;
  String description_long;
  String description_short;
  String usage_instructions;
  String meta_description;
  String meta_keywords;
}