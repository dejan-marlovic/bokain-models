part of model_base;

@Serializable()
class Consultation extends _$ConsultationSerializable implements FoModel
{
  bool area_face = false;
  bool area_chest = false;
  bool area_back = false;
  bool area_other = false;
  String skin_type_id;
  String customer_id;
  String salon_id;
  String service_id;
  String user_id;
  String comments_internal;
  String description;
  List<String> zones = new List();
  List<String> image_uris = new List(4);
  List<ProductRoutinePair> product_routines = new List();

  SymptomMap symptoms = new SymptomMap
  (
    open_comedones: 0,
    closed_comedones: 0,
    papules: 0,
    pustules: 0,
    cysts: 0,
    nodules: 0,
    seborrhea: 0,
    rosacea: 0,
    milia: false,
    pigmentation: false,
    surface_blood_vessels: false,
    acne_scars: false,
    texture: "normal"
  );

  /**
   * Survey data
   */
  /// Poke habits
  bool has_poke_habits;
  String poke_habits_frequency;
  List<String> poke_habits_how = new List();
  String poke_habits_result;
  List<String> poke_habits_consciously = new List();
  String poke_habits_consciously_other;
  List<String> poke_habits_unconsciously = new List();
  String poke_habits_unconsciously_other;

  /// Stress
  bool is_stressed;
  List<String> stress_causes = new List();
  String stress_causes_other;

  /// Insomnia
  bool has_insomnia;
  int has_insomnia_hours_sleep;
  String has_insomnia_bedtime;
  String has_insomnia_time_rise;

  /// Exercise
  bool does_exercise;
  String does_exercise_description;

  /// Climate
  bool is_climate_sensitive;
  String is_climate_sensitive_description;
  String is_climate_sensitive_sun_effect;

  /// Touching objects
  List<String> touching_objects = new List();
  String touching_objects_other;

  /**
   * FoModel fields
   */
  @override String id;
  @override DateTime created;
  @override String added_by;
  @override String status;
}