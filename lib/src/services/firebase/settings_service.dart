part of firebase_service;

@Injectable()
class SettingsService extends FirebaseServiceBase<Settings>
{
  SettingsService() : super("settings");

  @override
  Settings createModelInstance(Map<String, dynamic> data)
  {
    Settings model = new Settings();
    if (data != null) model.addAll(data);
    return model;
  }

  @override
  Map<String, dynamic> _serialize(Settings model)
  {
    Map<String, dynamic> data = super._serialize(model);

    /**
     * Serialize Score/Product Registry
     */
    List<Map<String, String>> spr = new List();
    for (List<ProductRoutinePair> pairs in model.spr)
    {
      Map<String, String> table = new Map();
      for (ProductRoutinePair pair in pairs) table[pair.product_id] = pair.product_routine_id;
      spr.add(table);
    }
    data["spr"] = spr;
    return data;
  }

  @override
  Settings _deserialize(Map<String, dynamic> data)
  {
    try
    {
      /**
       * Deserialize Score/Product Registry
       */
      List<List<ProductRoutinePair>> spr = new List();
      for (Map<String, String> table in data["spr"])
      {
        List<ProductRoutinePair> pairs = new List();
        for (String key in table.keys)
        {
          pairs.add(new ProductRoutinePair(key, table[key]));
        }
        spr.add(pairs);
      }
      data["spr"] = spr;


      return super._deserialize(data);
    }
    catch (e, s)
    {
      print(e);
      print(s);
      return null;
    }
  }
}