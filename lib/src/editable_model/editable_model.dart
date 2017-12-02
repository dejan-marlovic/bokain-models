part of model_base;

abstract class EditableModel extends ModelBase
{
  @override
  EditableModel(String id) : super(id)
  {
    status = "active";
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

  @override
  List<String> get tableColumns => super.tableColumns..addAll(["status"]);

  String get status => data["status"];  // active, frozen, disabled
  void set status(String value) { data["status"] = value; }
}