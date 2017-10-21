part of model_base;

class Consultation extends EditableModel
{
  @override
  Consultation(String customer_id, [String id = null]) : super(id)
  {
    customerId = customer_id;
    areaFace = false;
    areaChest = false;
    areaBack = false;
    areaOther = false;

    zones = new List();
  }

  @override
  Consultation.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    customerId = d["customer_id"];
    userId = d["user_id"];
    areaFace = d["area_face"];
    areaChest = d["area_chest"];
    areaBack = d["area_back"];
    areaOther = d["area_other"];

    zones = (d.containsKey("zones")) ? d["zones"] : new List();
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["created"] = ModelBase.timestampFormat(created);
    return table;
  }

  String get customerId => _data["customer_id"];
  String get userId => _data["user_id"];
  bool get areaFace => _data["area_face"];
  bool get areaChest => _data["area_chest"];
  bool get areaBack => _data["area_back"];
  bool get areaOther => _data["area_other"];
  List<String> get zones => _data["zones"];

  void set customerId(String value) { _data["customer_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set areaFace(bool value) { _data["area_face"] = value; }
  void set areaChest(bool value) { _data["area_chest"] = value; }
  void set areaBack(bool value) { _data["area_back"] = value; }
  void set areaOther(bool value) { _data["area_other"] = value; }
  void set zones(List<String> value) { _data["zones"] = value; }
}
