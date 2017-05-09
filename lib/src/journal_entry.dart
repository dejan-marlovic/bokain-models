part of model_base;

class JournalEntry extends ModelBase
{
  @override
  JournalEntry(String customer_id) : super()
  {
    imageFilenames = new List();
    customerId = customer_id;
  }

  @override
  JournalEntry.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    for (String key in d.keys)
    {
      _data[key] = d[key];
    }

    if (imageFilenames == null) imageFilenames = new List();
  }

  @override
  Map<String, String> get toTable => {"comments_internal":commentsInternal, "comments_external":commentsExternal};

  String get commentsExternal => _data["commments_external"];
  String get commentsInternal => _data["comments_internal"];
  String get customerId => _data["customer_id"];
  List<String> get imageFilenames => _data["image_filenames"];
  void set commentsExternal(String value) { _data["comments_external"] = value; }
  void set commentsInternal(String value) { _data["comments_internal"] = value; }
  void set customerId(String value) { _data["customer_id"] = value; }
  void set imageFilenames(List<String> value) { _data["image_filenames"] = value; }
}