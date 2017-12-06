part of model_base;

@Serializable()
class ProductCategory extends _$ProductCategorySerializable implements FoModel
{
  String name;
  String image_uri;
  int search_rank;
  String url_name;

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;

  @override
  String toString() => name;
}

@Serializable()
class ProductCategoryPhrases extends _$ProductCategoryPhrasesSerializable
{
  String name;
  String description;
  String meta_description;
  String meta_keywords;
}