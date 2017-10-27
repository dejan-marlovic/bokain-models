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
    rosacea = false;
    milia = false;
    pigmentation = false;
    closedComedonesLevel = 0;
    cystsLevel = 0;
    nodulesLevel = 0;
    pustulesLevel = 0;
    papulesLevel = 0;
    openComedonesLevel = 0;
    seborrheaLevel = 0;
    texture = "normal";
    skinTypeId = "7"; // normal
    productIds = new List();
    zones = new List();
  }

  @override
  Consultation.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    customerId = d["customer_id"];
    salonId = d["salon_id"];
    serviceId = d["service_id"];
    userId = d["user_id"];
    commentsInternal = d["comments_internal"];
    areaFace = d["area_face"];
    areaChest = d["area_chest"];
    areaBack = d["area_back"];
    areaOther = d["area_other"];
    rosacea = d["rosacea"];
    milia = d["milia"];
    pigmentation = d["pigmentation"];
    closedComedonesLevel = d["closed_comedones_level"];
    cystsLevel = d["cysts_level"];
    nodulesLevel = d["nodules_level"];
    pustulesLevel = d["pastules_level"];
    papulesLevel = d["papules_level"];
    openComedonesLevel = d["open_comedones_level"];
    seborrheaLevel = d["seborrhea_level"];
    texture = d["texture"];
    skinTypeId = d["skin_type_id"];
    productIds = (d.containsKey("product_ids")) ? d["product_ids"] : new List();
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
  String get salonId => _data["salon_id"];
  String get serviceId => _data["service_id"];
  String get userId => _data["user_id"];
  String get commentsInternal => _data["comments_internal"];
  bool get areaFace => _data["area_face"];
  bool get areaChest => _data["area_chest"];
  bool get areaBack => _data["area_back"];
  bool get areaOther => _data["area_other"];
  int get openComedonesLevel => _data["open_comedones_level"];
  int get closedComedonesLevel => _data["closed_comedones_level"];
  int get cystsLevel => _data["cysts_level"];
  int get nodulesLevel => _data["nodules_level"];
  int get papulesLevel => _data["papules_level"];
  int get pustulesLevel =>_data["pustules_level"];
  int get seborrheaLevel => _data["seborrhea_level"];
  bool get rosacea => _data["rosacea"];
  bool get milia => _data["milia"];
  bool get pigmentation => _data["pigmentation"];
  bool get surfaceBloodVessels => _data["surface_blood_vessels"];
  bool get acneScars => _data["acne_scars"];
  String get texture => _data["texture"];
  String get skinTypeId => _data["skin_type_id"];
  List<String> get productIds => _data["product_ids"];
  List<String> get zones => _data["zones"];

  void set customerId(String value) { _data["customer_id"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set commentsInternal(String value) { _data["comments_internal"] = value; }
  void set areaFace(bool value) { _data["area_face"] = value; }
  void set areaChest(bool value) { _data["area_chest"] = value; }
  void set areaBack(bool value) { _data["area_back"] = value; }
  void set areaOther(bool value) { _data["area_other"] = value; }
  void set openComedonesLevel(int value) { _data["open_comedones_level"] = value; }
  void set closedComedonesLevel(int value) { _data["closed_comedones_level"] = value; }
  void set cystsLevel(int value) { _data["cysts_level"] = value; }
  void set nodulesLevel(int value) { _data["nodules_level"] = value; }
  void set papulesLevel(int value) { _data["papules_level"] = value; }
  void set pustulesLevel(int value) { _data["pustules_level"] = value; }
  void set seborrheaLevel(int value) { _data["seborrhea_level"] = value; }
  void set rosacea(bool value) { _data["rosacea"] = value; }
  void set milia(bool value) { _data["milia"] = value; }
  void set pigmentation(bool value) { _data["pigmentation"] = value; }
  void set surfaceBloodVessels(bool value) { _data["surface_blood_vessels"] = value; }
  void set acneScars(bool value) { _data["acne_scars"] = value; }
  void set texture(String value) { _data["texture"] = value; } /* dry, normal, oily */
  void set productIds(List<String> value)  { _data["product_ids"] = value; }
  void set zones(List<String> value) { _data["zones"] = value; }
  void set skinTypeId(String value) { _data["skin_type_id"] = value; }
}
