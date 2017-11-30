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
        rosacea: 0,
        milia: false,
        pigmentation: false,
        surfaceBloodVessels: false,
        acneScars: false,
        texture: "normal"
    );
    skinTypeId = null;
    zones = new List();
    imageURIs = new List(4);

    /**
     * Survey data
     */
    touchingObjects = new List();
    pokeHabitsHow = new List();
    pokeHabitsConsciously = new List();
    pokeHabitsUnconsciously = new List();
    stressCauses = new List();
  }

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> data = super.encoded;
    data["symptoms"] = symptoms.encoded;
    data["product_routines"] = new Map();
    for (ProductRoutinePair pair in productRoutinePairs)
    {
      data["product_routines"][pair.productId] = pair.productRoutineId;
    }
    return data;
  }

  @override
  Consultation.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    customerId = d["customer_id"];
    salonId = d["salon_id"];
    serviceId = d["service_id"];
    userId = d["user_id"];
    description = d["description"];
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

    if (d.containsKey("product_routines")) productRoutinePairs = (d["product_routines"].keys).map((key) => new ProductRoutinePair(key, d["product_routines"][key])).toList();

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

    /**
     * Survey data
     */
    hasPokeHabits = d["has_poke_habits"];
    pokeHabitsFrequency = d["poke_habits_frequency"];
    pokeHabitsHow = d.containsKey("poke_habits_how") ? d["poke_habits_how"] : new List();
    pokeHabitsResult = d["poke_habits_result"];
    pokeHabitsConsciously = d.containsKey("poke_habits_consciously") ? d["poke_habits_consciously"] : new List();
    pokeHabitsConsciouslyOther = d["poke_habits_consciously_other"];
    pokeHabitsUnconsciously = d.containsKey("poke_habits_unconsciously") ? d["poke_habits_unconsciously"] : new List();
    pokeHabitsUnconsciouslyOther = d["poke_habits_unconsciously_other"];
    isStressed = d["is_stressed"];
    stressCauses = d.containsKey("stress_causes") ? d["stress_causes"] : new List();
    hasInsomnia = d["has_insomnia"];
    hasInsomniaHoursSleep = d["has_insomnia_hours_sleep"];
    hasInsomniaBedtime = d["has_insomnia_bedtime"];
    hasInsomniaTimeRise = d["has_insomnia_time_rise"];
    doesExercise = d["does_exercise"];
    doesExerciseDescription = d["does_exercise_description"];
    isClimateSensitive = d["is_climate_sensitive"];
    isClimateSensitiveDescription = d["is_climate_sensitive_description"];
    isClimateSensitiveSunEffect = d["is_climate_sensitive_sun_effect"];
    touchingObjects = d.containsKey("touching_objects") ? d["touching_objects"] : new List();
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
  String get description => _data["description"];
  String get commentsInternal => _data["comments_internal"];
  bool get areaFace => _data["area_face"];
  bool get areaChest => _data["area_chest"];
  bool get areaBack => _data["area_back"];
  bool get areaOther => _data["area_other"];
  String get skinTypeId => _data["skin_type_id"];

  List<String> get productIds => productRoutinePairs.map((p) => p.productId).toList(growable: false);
  List<String> get zones => _data["zones"];
  List<String> get imageURIs => _data["image_uris"];

  void set customerId(String value) { _data["customer_id"] = value; }
  void set salonId(String value) { _data["salon_id"] = value; }
  void set serviceId(String value) { _data["service_id"] = value; }
  void set userId(String value) { _data["user_id"] = value; }
  void set description(String value) { _data["description"] = value; }
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
    productRoutinePairs.removeWhere((pair) => !value.contains(pair.productId));

    for (String product_id in value)
    {
      if (productRoutinePairs.firstWhere((pair) => pair.productId == product_id, orElse: () => null) == null)
      {
        productRoutinePairs.add(new ProductRoutinePair(product_id, null));
      }
    }
  }

  List<ProductRoutinePair> productRoutinePairs = new List();
  SymptomMap symptoms;


/**
 * Survey data
 */
  // Poke habits
  bool get hasPokeHabits => _data["has_poke_habits"];
  String get pokeHabitsFrequency => _data["poke_habits_frequency"];
  List<String> get pokeHabitsHow => _data["poke_habits_how"];
  String get pokeHabitsResult => _data["poke_habits_result"];
  List<String> get pokeHabitsConsciously => _data["poke_habits_consciously"];
  String get pokeHabitsConsciouslyOther => _data["poke_habits_consciously_other"];
  List<String> get pokeHabitsUnconsciously => _data["poke_habits_unconsciously"];
  String get pokeHabitsUnconsciouslyOther => _data["poke_habits_unconsciously_other"];

  // Stress
  bool get isStressed => _data["is_stressed"];
  List<String> get stressCauses => _data["stress_causes"];
  String get stressCauseOther => _data["stress_cause_other"];

  // Insomnia
  bool get hasInsomnia => _data["has_insomnia"];
  int get hasInsomniaHoursSleep => _data["has_insomnia_hours_sleep"];
  String get hasInsomniaBedtime => _data["has_insomnia_bedtime"];
  String get hasInsomniaTimeRise => _data["has_insomnia_time_rise"];

  // Exercise
  bool get doesExercise => _data["does_exercise"];
  String get doesExerciseDescription => _data["does_exercise_description"];

  // Climate
  bool get isClimateSensitive => _data["is_climate_sensitive"];
  String get isClimateSensitiveDescription => _data["is_climate_sensitive_description"];
  String get isClimateSensitiveSunEffect => _data["is_climate_sensitive_sun_effect"];

  // Touching objects
  List<String> get touchingObjects => _data["touching_objects"];
  String get touchingObjectsOther => _data["touching_objects_other"];

  // Poke habits
  void set hasPokeHabits(bool value) { _data["has_poke_habits"] = value; }
  void set pokeHabitsFrequency(String value) { _data["poke_habits_frequency"] = value; }
  void set pokeHabitsHow(List<String> value) { _data["poke_habits_how"] = value; }
  void set pokeHabitsResult(String value) {_data["poke_habits_result"] = value; }
  void set pokeHabitsConsciously(List<String> value) { _data["poke_habits_consciously"] = value; }
  void set pokeHabitsConsciouslyOther(String value) { _data["poke_habits_consciously_other"] = value; }
  void set pokeHabitsUnconsciously(List<String> value) { _data["poke_habits_unconsciously"] = value; }
  void set pokeHabitsUnconsciouslyOther(String value) { _data["poke_habits_unconsciously_other"] = value; }

  // Stress
  void set isStressed(bool value) { _data["is_stressed"] = value; }
  void set stressCauses(List<String> value) { _data["stress_causes"] = value; }
  void set stressCauseOther(String value) { _data["stress_cause_other"] = value; }

  // Insomnia
  void set hasInsomnia(bool value) { _data["has_insomnia"] = value; }
  void set hasInsomniaHoursSleep(int value) { _data["has_insomnia_hours_sleep"] = value; }
  void set hasInsomniaBedtime(String value) { _data["has_insomnia_bedtime"] = value; }
  void set hasInsomniaTimeRise(String value) { _data["has_insomnia_time_rise"] = value; }

  // Exercise
  void set doesExercise(bool value) { _data["does_exercise"] = value; }
  void set doesExerciseDescription(String value) { _data["does_exercise_description"] = value; }

  // Climate
  void set isClimateSensitive(bool value) { _data["is_climate_sensitive"] = value; }
  void set isClimateSensitiveDescription(String value) { _data["is_climate_sensitive_description"] = value; }
  void set isClimateSensitiveSunEffect(String value) { _data["is_climate_sensitive_sun_effect"] = value; }

  // Touching objects
  void set touchingObjects(List<String> value) { _data["touching_objects"] = value; }
  void set touchingObjectsOther(String value) { _data["touching_objects_other"] = value; }
}