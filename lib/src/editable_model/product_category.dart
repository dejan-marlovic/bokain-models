part of model_base;

class ProductCategory extends EditableModel
{
  @override
  ProductCategory([String id = null]) : super(id)
  {
    searchRank = 0;
  }

  @override
  ProductCategory.decode(String id, Map<String, dynamic> data) : super.decode(id, data)
  {
    name = data["name"];
    imageURI = data["image_uri"];
    searchRank = data["search_rank"];
    urlName = data["url_name"];
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["name"] = name;
    table["search_rank"] = strSearchRank;
    table["status"] = status;
    return table;
  }

  @override
  String toString() => name;

  String get name => _data["name"];
  String get imageURI => _data["image_uri"];
  int get searchRank => _data["search_rank"];
  String get urlName => _data["url_name"];
  String get strSearchRank => searchRank.toString();

  void set name(String value) { _data["name"] = value; }
  void set imageURI(String value) { _data["image_uri"] = value; }
  void set searchRank(int value) { _data["search_rank"] = value; }
  void set urlName(String value) {_data["url_name"] = value; }
  void set strSearchRank(String value) { try { searchRank = int.parse(value); } on FormatException catch(e) { print(e); } }
}

class ProductCategoryPhrases
{
  ProductCategoryPhrases() : _data = new Map();

  ProductCategoryPhrases.decode(this._data)
  {
    if (_data == null) _data = new Map();
  }

  Map<String, String> get data => _data;

  String get name => _data["name"];
  String get description => _data["description"];
  String get metaDescription => _data["meta_description"];
  String get metaKeywords => _data["meta_keywords"];

  void set name(String value) { _data["name"] = value; }
  void set description(String value) { _data["description"] = value; }
  void set metaDescription(String value) { _data["meta_description"] = value; }
  void set metaKeywords(String value) { _data["meta_keywords"] = value; }

  Map<String, String> _data;
}