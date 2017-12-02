part of model_base;

class Product extends EditableModel
{
  @override
  Product([String id = null]) : super(id)
  {
    ingredientIds = new List();
    relatedProductIds = new List();
    subProductIds = new List();
    productRoutineIds = new List();
    priceEUR = 0.0;
    priceSEK = 0.0;
    priceUSD = 0.0;
    type = "standard";

    vat = 25;
  }

  @override
  Product.decode(String id, Map<String, dynamic> data) : super.decode(id, data)
  {
    name = data["name"];
    articleNo = data["article_no"];
    buyPriceSEK = data["buy_price_sek"];
    imageURI = data["image_uri"];
    ingredientIds = data.containsKey("ingredient_ids") ? data["ingredient_ids"] : new List();
    relatedProductIds = data.containsKey("related_product_ids") ? data["related_product_ids"] : new List();
    subProductIds = data.containsKey("sub_product_ids") ? data["sub_product_ids"] : new List();
    productRoutineIds = data.containsKey("product_routine_ids") ? data["product_routine_ids"] : new List();

    priceEUR = (data["price_eur"] as num);
    priceSEK = (data["price_sek"] as num);
    priceUSD = (data["price_usd"] as num);

    productCategoryId = data["product_category_id"];
    searchRank = data["search_rank"];
    score = data["score"];
    stock = data["stock"];
    type = data["type"];
    urlName = data["url_name"];
    vat = data["vat"];
    volume = data["volume"];
    weight = data["weight"];
  }

  @override
  List<String> get tableColumns => super.tableColumns..addAll(["name", "article_no", "product_type", "url_name", "score", "search_rank", "price_sek", "status"]);

  @override
  String toString() => name;

  String get name => data["name"];
  String get articleNo => data["article_no"];
  int get buyPriceSEK => data["buy_price_sek"];
  String get imageURI => data["image_uri"];
  List<String> get ingredientIds => data["ingredient_ids"];
  List<String> get relatedProductIds => data["related_product_ids"];
  List<String> get subProductIds => data["sub_product_ids"];
  List<String> get productRoutineIds => data["product_routine_ids"];
  num get priceEUR => data["price_eur"];
  num get priceSEK => data["price_sek"];
  num get priceUSD => data["price_usd"];
  String get productCategoryId => data["product_category_id"];
  int get searchRank => data["search_rank"];
  int get score => data["score"];
  int get stock => data["stock"];
  String get type => data["type"];
  String get urlName => data["url_name"];
  int get vat => data["vat"];
  int get volume => data["volume"];
  int get weight => data["weight"];

  String get strBuyPriceSEK => (buyPriceSEK == null) ? "0" : buyPriceSEK.toString();
  String get strPriceEUR => (priceEUR == null) ? "0" : priceEUR.toString();
  String get strPriceSEK => (priceSEK == null) ? "0" : priceSEK.toString();
  String get strPriceUSD => (priceUSD == null) ? "0" : priceUSD.toString();
  String get strScore => (score == null) ? "0" : score.toString();
  String get strSearchRank => (searchRank == null) ? "0" : searchRank.toString();
  String get strStock => (stock == null) ? "0" : stock.toString();
  String get strVat => (vat == null) ? "0" : vat.toString();
  String get strVolume => (volume == null) ? "0" : volume.toString();
  String get strWeight => (weight == null) ? "0" : weight.toString();

  void set name(String value) { data["name"] = value; }
  void set articleNo(String value) { data["article_no"] = value; }
  void set buyPriceSEK(int value) { data["buy_price_sek"] = value; }
  void set imageURI(String value) { data["image_uri"] = value; }
  void set ingredientIds(List<String> value) { data["ingredient_ids"] = value; }
  void set relatedProductIds(List<String> value) { data["related_product_ids"] = value; }
  void set subProductIds(List<String> value) { data["sub_product_ids"] = value; }
  void set productRoutineIds(List<String> value) { data["product_routine_ids"] = value; }
  void set priceEUR(num value) { data["price_eur"] = value; }
  void set priceSEK(num value) { data["price_sek"] = value; }
  void set priceUSD(num value) { data["price_usd"] = value; }
  void set productCategoryId(String value) { data["product_category_id"] = value; }
  void set searchRank(int value) { data["search_rank"] = value; }
  void set stock(int value) { data["stock"] = value; }
  void set score(int value) { data["score"] = value; }     // Score based on webshop sales, 1% tear / day
  void set type(String value) { data["type"] = value; }
  void set urlName(String value) { data["url_name"] = value; }
  void set vat(int value) { data["vat"] = value; }
  void set volume(int value) { data["volume"] = value; }   // Ml
  void set weight(int value) { data["weight"] = value; }   // Grams
  void set strBuyPriceSEK(String value) { try { buyPriceSEK = int.parse(value); } on FormatException catch(e) { print(e); }}
  void set strPriceEUR(String value) { try { priceEUR = num.parse(value); } on FormatException catch(e) { print(e); }}
  void set strPriceSEK(String value) { try { priceSEK = num.parse(value); } on FormatException catch(e) { print(e); }}
  void set strPriceUSD(String value) { try { priceUSD = num.parse(value); } on FormatException catch(e) { print(e); }}
  void set strScore(String value) { try { score = int.parse(value); } on FormatException catch(e) { print(e); }}
  void set strSearchRank(String value) { try { searchRank = int.parse(value); } on FormatException catch(e) { print(e); }}
  void set strStock(String value) { try { stock = int.parse(value); } on FormatException catch(e) { print(e); }}
  void set strVat(String value) { try { vat = int.parse(value); } on FormatException catch(e) { print(e); }}
  void set strVolume(String value) { try { volume = int.parse(value); } on FormatException catch(e) { print(e); }}
  void set strWeight(String value) { try { weight = int.parse(value); } on FormatException catch(e) { print(e); }}
}

class ProductPhrases
{
  ProductPhrases() : _data = new Map();

  ProductPhrases.decode(this._data)
  {
    if (_data == null) _data = new Map();
  }

  Map<String, String> get data => _data;

  String get name => _data["name"];
  String get descriptionLong => _data["description_long"];
  String get descriptionShort => _data["description_short"];
  String get usageInstructions => _data["usage_instructions"];
  String get metaDescription => _data["meta_description"];
  String get metaKeywords => _data["meta_keywords"];

  void set name(String value) { _data["name"] = value; }
  void set descriptionLong(String value) { _data["description_long"] = value; }
  void set descriptionShort(String value) { _data["description_short"] = value; }
  void set usageInstructions(String value) { _data["usage_instructions"] = value ;}
  void set metaDescription(String value) { _data["meta_description"] = value; }
  void set metaKeywords(String value) { _data["meta_keywords"] = value; }

  Map<String, String> _data;
}