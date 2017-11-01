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

    symptoms = new SymptomMap(
        openComedones: 0,
        closedComedones: 0,
        papules: 0,
        pustules: 0,
        cysts: 0,
        nodules: 0,
        seborrhea: 0,
        rosacea: false,
        milia: false,
        pigmentation: false,
        surfaceBloodVessels: false,
        acneScars: false,
        texture: "normal"
    );
    productRoutineRegistry = new Map();
    skinTypeId = null;
    zones = new List();
    imageURIs = new List(4);
  }

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> data = super.encoded;
    data["symptoms"] = symptoms.encoded;
    data["product_routines"] = productRoutineRegistry;
    return data;
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

    symptoms = new SymptomMap(
        openComedones: d['symptoms']['open_comedones'],
        closedComedones: d['symptoms']['closed_comedones'],
        papules: d['symptoms']['papules'],
        pustules: d['symptoms']['pustules'],
        cysts: d['symptoms']['cysts'],
        nodules: d['symptoms']['nodules'],
        seborrhea: d['symptoms']['seborrhea'],
        rosacea: d['symptoms']['rosacea'],
        milia: d['symptoms']['milia'],
        pigmentation: d['symptoms']['pigmentation'],
        surfaceBloodVessels: d['symptoms']['surface_blood_vessels'],
        acneScars: d['symptoms']['acne_scars'],
        texture: (d['symptoms'].containsKey("texture")) ? d['symptoms']['texture'] : "normal"
    );

    productRoutineRegistry = d.containsKey('product_routines') ? d['product_routines'] : new Map();

    skinTypeId = d["skin_type_id"];
    zones = (d.containsKey("zones")) ? d["zones"] : new List();

    imageURIs = new List(4);
    if (d.containsKey("image_uris"))
    {
      for (int i = 0; i < d["image_uris"].length; i++)
      {
        imageURIs[i] = d["image_uris"][i];
      }
    }
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
  String get texture => _data["texture"];
  String get skinTypeId => _data["skin_type_id"];

  List<String> get productIds => productRoutineRegistry.keys.toList();
  List<String> get zones => _data["zones"];
  List<String> get imageURIs => _data["image_uris"];

  void set customerId(String value) { _data["customer_id"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set commentsInternal(String value) { _data["comments_internal"] = value; }
  void set areaFace(bool value) { _data["area_face"] = value; }
  void set areaChest(bool value) { _data["area_chest"] = value; }
  void set areaBack(bool value) { _data["area_back"] = value; }
  void set areaOther(bool value) { _data["area_other"] = value; }
  void set skinTypeId(String value) { _data["skin_type_id"] = value; }
  void set zones(List<String> value) { _data["zones"] = value; }
  void set imageURIs(List<String> value) { _data["image_uris"] = value; }
  void set productIds(List<String> value)
  {
    productRoutineRegistry.keys.where((id) => !value.contains(id)).toList(growable: false).forEach(productRoutineRegistry.remove);
    for (String id in value)
    {
      if (!productRoutineRegistry.containsKey(id)) productRoutineRegistry[id] = null;
    }
  }

  Map<String, String> productRoutineRegistry;
  SymptomMap symptoms;
}