part of model_base;

class WebshopContent extends EditableModel
{
  @override
  WebshopContent([String id = null]) : super(id)
  {
  }

  @override
  WebshopContent.decode(String id, Map<String, dynamic> data) : super.decode(id, data)
  {
  }

  @override
  String toString() => name;

  String get name => data["name"];
  void set name(String value) { data["name"] = value; }

  final String logoUrl = "";
  final String faviconUrl = "";
}

class WebshopContentPhrases
{
  WebshopContentPhrases() : _data = new Map()
  {
    metaKeywords = "";
  }

  WebshopContentPhrases.decode(this._data)
  {
    if (_data == null) _data = new Map();

    if (metaKeywords == null) metaKeywords = "";
  }

  Map<String, String> get data => _data;

  String get title => _data["title"];
  String get metaDescription => _data["meta_description"];
  String get metaKeywords => _data["meta_keywords"];
  String get frontpageHeader => _data["frontpage_header"];
  String get frontpageText => _data["frontpage_text"];
  String get aboutHeader => _data["about_header"];
  String get aboutText => _data["about_text"];
  String get customerServiceHeader => _data["customer_service_header"];
  String get customerServiceText => _data["customer_service_text"];
  String get faqHeader => _data["faq_header"];
  String get faqText => _data["faq_text"];
  String get skinConsultationHeader => _data["skin_consultation_header"];
  String get skinConsultationText => _data["skin_consultation_text"];
  String get standardTermsHeader => _data["standard_terms_header"];
  String get standardTermsText => _data["standard_terms_text"];

  void set title(String value) { _data["title"] = value; }
  void set metaDescription(String value) { _data["meta_description"] = value; }
  void set metaKeywords(String value) { _data["meta_keywords"] = value; }
  void set frontpageHeader(String value) { _data["frontpage_header"] = value; }
  void set frontpageText(String value) { _data["frontpage_text"] = value; }
  void set aboutHeader(String value) { _data["about_header"] = value; }
  void set aboutText(String value) { _data["about_text"] = value; }
  void set customerServiceHeader(String value) { _data["customer_service_header"] = value; }
  void set customerServiceText(String value) { _data["customer_service_text"] = value; }
  void set faqHeader(String value) { _data["faq_header"] = value; }
  void set faqText(String value) { _data["faq_text"] = value; }
  void set skinConsultationHeader(String value) { _data["skin_consultation_header"] = value; }
  void set skinConsultationText(String value) { _data["skin_consultation_text"] = value; }
  void set standardTermsHeader(String value) { _data["standard_terms_header"] = value; }
  void set standardTermsText(String value) { _data["standard_terms_text"] = value; }

  Map<String, String> _data;
}