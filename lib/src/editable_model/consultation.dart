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
  List<String> get tableColumns => super.tableColumns..addAll(["created", "user_id"]);

  String get customerId => data["customer_id"];
  String get salonId => data["salon_id"];
  String get serviceId => data["service_id"];
  String get userId => data["user_id"];
  String get description => data["description"];
  String get commentsInternal => data["comments_internal"];
  bool get areaFace => data["area_face"];
  bool get areaChest => data["area_chest"];
  bool get areaBack => data["area_back"];
  bool get areaOther => data["area_other"];
  String get skinTypeId => data["skin_type_id"];

  List<String> get productIds => productRoutinePairs.map((p) => p.productId).toList(growable: false);
  List<String> get zones => data["zones"];
  List<String> get imageURIs => data["image_uris"];

  void set customerId(String value) { data["customer_id"] = value; }
  void set salonId(String value) { data["salon_id"] = value; }
  void set serviceId(String value) { data["service_id"] = value; }
  void set userId(String value) { data["user_id"] = value; }
  void set description(String value) { data["description"] = value; }
  void set commentsInternal(String value) { data["comments_internal"] = value; }
  void set areaFace(bool value) { data["area_face"] = value; }
  void set areaChest(bool value) { data["area_chest"] = value; }
  void set areaBack(bool value) { data["area_back"] = value; }
  void set areaOther(bool value) { data["area_other"] = value; }
  void set skinTypeId(String value) { data["skin_type_id"] = value; }
  void set zones(List<String> value) { data["zones"] = value; }
  void set imageURIs(List<String> value) { data["image_uris"] = value; }
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
  bool get hasPokeHabits => data["has_poke_habits"];
  String get pokeHabitsFrequency => data["poke_habits_frequency"];
  List<String> get pokeHabitsHow => data["poke_habits_how"];
  String get pokeHabitsResult => data["poke_habits_result"];
  List<String> get pokeHabitsConsciously => data["poke_habits_consciously"];
  String get pokeHabitsConsciouslyOther => data["poke_habits_consciously_other"];
  List<String> get pokeHabitsUnconsciously => data["poke_habits_unconsciously"];
  String get pokeHabitsUnconsciouslyOther => data["poke_habits_unconsciously_other"];

  // Stress
  bool get isStressed => data["is_stressed"];
  List<String> get stressCauses => data["stress_causes"];
  String get stressCauseOther => data["stress_cause_other"];

  // Insomnia
  bool get hasInsomnia => data["has_insomnia"];
  int get hasInsomniaHoursSleep => data["has_insomnia_hours_sleep"];
  String get hasInsomniaBedtime => data["has_insomnia_bedtime"];
  String get hasInsomniaTimeRise => data["has_insomnia_time_rise"];

  // Exercise
  bool get doesExercise => data["does_exercise"];
  String get doesExerciseDescription => data["does_exercise_description"];

  // Climate
  bool get isClimateSensitive => data["is_climate_sensitive"];
  String get isClimateSensitiveDescription => data["is_climate_sensitive_description"];
  String get isClimateSensitiveSunEffect => data["is_climate_sensitive_sun_effect"];

  // Touching objects
  List<String> get touchingObjects => data["touching_objects"];
  String get touchingObjectsOther => data["touching_objects_other"];

  // Poke habits
  void set hasPokeHabits(bool value) { data["has_poke_habits"] = value; }
  void set pokeHabitsFrequency(String value) { data["poke_habits_frequency"] = value; }
  void set pokeHabitsHow(List<String> value) { data["poke_habits_how"] = value; }
  void set pokeHabitsResult(String value) {data["poke_habits_result"] = value; }
  void set pokeHabitsConsciously(List<String> value) { data["poke_habits_consciously"] = value; }
  void set pokeHabitsConsciouslyOther(String value) { data["poke_habits_consciously_other"] = value; }
  void set pokeHabitsUnconsciously(List<String> value) { data["poke_habits_unconsciously"] = value; }
  void set pokeHabitsUnconsciouslyOther(String value) { data["poke_habits_unconsciously_other"] = value; }

  // Stress
  void set isStressed(bool value) { data["is_stressed"] = value; }
  void set stressCauses(List<String> value) { data["stress_causes"] = value; }
  void set stressCauseOther(String value) { data["stress_cause_other"] = value; }

  // Insomnia
  void set hasInsomnia(bool value) { data["has_insomnia"] = value; }
  void set hasInsomniaHoursSleep(int value) { data["has_insomnia_hours_sleep"] = value; }
  void set hasInsomniaBedtime(String value) { data["has_insomnia_bedtime"] = value; }
  void set hasInsomniaTimeRise(String value) { data["has_insomnia_time_rise"] = value; }

  // Exercise
  void set doesExercise(bool value) { data["does_exercise"] = value; }
  void set doesExerciseDescription(String value) { data["does_exercise_description"] = value; }

  // Climate
  void set isClimateSensitive(bool value) { data["is_climate_sensitive"] = value; }
  void set isClimateSensitiveDescription(String value) { data["is_climate_sensitive_description"] = value; }
  void set isClimateSensitiveSunEffect(String value) { data["is_climate_sensitive_sun_effect"] = value; }

  // Touching objects
  void set touchingObjects(List<String> value) { data["touching_objects"] = value; }
  void set touchingObjectsOther(String value) { data["touching_objects_other"] = value; }
}