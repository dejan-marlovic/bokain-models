part of model_base;

@Serializable()
class WebshopContent extends _$WebshopContentSerializable implements FoModel
{
  String name;
  String logo_uri;
  String favicon_uri;

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
class WebshopContentPhrases extends _$WebshopContentPhrasesSerializable
{
  String title;
  String meta_description;
  String meta_keywords;
  String frontpage_header;
  String frontpage_text;
  String about_header;
  String about_text;
  String customer_service_header;
  String customerServiceText;
  String faq_header;
  String faq_text;
  String skin_consultation_header;
  String skin_consultation_text;
  String standard_terms_header;
  String standard_terms_text;
}