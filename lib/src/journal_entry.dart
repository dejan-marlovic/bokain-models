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
      _data[key] = d[key];
    }

    if (commentsInternal == null) commentsInternal = "";
    if (commentsExternal == null) commentsExternal = "";
    if (imageURIs == null) imageURIs = new List();
  }

  @override
  Map<String, String> toTableRow() => {"comments_internal":commentsInternal, "comments_external":commentsExternal};

  String get commentsExternal => _data["comments_external"];
  String get commentsInternal => _data["comments_internal"];
  String get customerId => _data["customer_id"];
  List<String> get imageURIs => _data["image_uris"];
  void set commentsExternal(String value) { _data["comments_external"] = value; }
  void set commentsInternal(String value) { _data["comments_internal"] = value; }
  void set customerId(String value) { _data["customer_id"] = value; }
  void set imageURIs(List<String> value) { _data["image_uris"] = value; }
}