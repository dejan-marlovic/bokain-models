part of model_base;

class JournalEntry extends ModelBase
{
  @override
  JournalEntry(String id, String customer_id) : super(id)
  {
    imageURIs = new List();
    customerId = customer_id;
    commentsInternal = "";
    commentsExternal = "";
  }

  @override
  JournalEntry.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    for (String key in d.keys)
    {
      data[key] = d[key];
    }

    if (commentsInternal == null) commentsInternal = "";
    if (commentsExternal == null) commentsExternal = "";
    if (imageURIs == null) imageURIs = new List();
  }

  List<String> get tableColumns => super.tableColumns..addAll(["comments_internal", "comments_external"]);

  String get commentsExternal => data["comments_external"];
  String get commentsInternal => data["comments_internal"];
  String get customerId => data["customer_id"];
  List<String> get imageURIs => data["image_uris"];
  void set commentsExternal(String value) { data["comments_external"] = value; }
  void set commentsInternal(String value) { data["comments_internal"] = value; }
  void set customerId(String value) { data["customer_id"] = value; }
  void set imageURIs(List<String> value) { data["image_uris"] = value; }
}