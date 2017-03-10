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
  EditableModel.from(EditableModel other) : super.from(other);

  @override
  EditableModel.decode(Map<String, dynamic> d) : super.decode(d)
  {
    addedBy = d["added_by"];
    status = d["status"];
  }

  @override
  Map<String, dynamic> get encoded => super.encoded;

  String get addedBy => _data["added_by"];
  String get status => _data["status"];  // active, frozen, disabled

  void set addedBy(String value) { _data["added_by"] = value; }
  void set status(String value) { _data["status"] = value; }
}