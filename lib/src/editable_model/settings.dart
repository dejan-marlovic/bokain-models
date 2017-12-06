part of model_base;

class Settings extends EditableModel
{
  @override
  Settings(String id) : super(id);

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> output = super.encoded;

    List<Map<String, String>> spr = new List();
    for (List<ProductRoutinePair> pairs in scoreProductRegistry)
    {
      Map<String, String> table = new Map();
      for (ProductRoutinePair pair in pairs)
      {
        table[pair.product_id] = pair.productRoutineId;
      }
      spr.add(table);
    }
    output["spr"] = spr;
    return output;
  }

  @override
  Settings.decode(String id, Map<String, dynamic> data) : super.decode(id, data)
  {
    if (data.containsKey("spr"))
    {
      scoreProductRegistry = new List();
      for (Map<String, String> table in data["spr"])
      {
        List<ProductRoutinePair> pairs = new List();
        for (String key in table.keys)
        {
          pairs.add(new ProductRoutinePair(key, table[key]));
        }
        scoreProductRegistry.add(pairs);
      }
    }
  }

  List<List<ProductRoutinePair>> scoreProductRegistry = [];
}

class ProductRoutinePair
{
  ProductRoutinePair(this.product_id, this.productRoutineId);

  Map<String, String> get encoded => {"product_id":productId, "product_routine_id":productRoutineId};

  final String productId;
  String productRoutineId;
}