part of model_base;

abstract class EditableModel extends ModelBase
{
  @override
  EditableModel([String current_status = "active"]) : super()
  {
    status = current_status;
  }

  @override
  EditableModel.from(EditableModel other) : super.from(other);

  @override
  EditableModel.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    status = d["status"];
  }

  @override
  Map<String, dynamic> get encoded => super.encoded;

  String get status => _data["status"];  // active, frozen, disabled
  void set status(String value) { _data["status"] = value; }
}