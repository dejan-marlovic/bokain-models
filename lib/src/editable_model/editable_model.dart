part of model_base;

abstract class EditableModel extends ModelBase
{
  @override
  EditableModel([String current_status = "active", String added_by = null]) : super()
  {
    status = current_status;
    addedBy = added_by;
  }

  @override
  EditableModel.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  EditableModel.decode(Map<String, String> data) : super.decode(data)
  {
    addedBy = data["added_by"];
    status = data["status"];
  }

  @override
  Map<String, String> encode()
  {
    Map<String, String> data = super.encode();

    // TODO: add any non-string params here

    return data;
  }

  String get addedBy => _data["added_by"];
  String get status => _data["status"];  // active, frozen, disabled

  void set addedBy(String value) { _data["added_by"] = value; }
  void set status(String value) { _data["status"] = value; }
}