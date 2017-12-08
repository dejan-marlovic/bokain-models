part of model_base;

@Serializable()
class JournalEntry extends _$JournalEntrySerializable implements FoModel
{
  String comments_external = "" ;
  String comments_internal = "";
  String customer_id;
  List<String> image_uris = new List();

  String id;
  String added_by;
  DateTime created;
  String status;
}