import 'package:fo_components/fo_components.dart';
import 'dart:convert';

class SkinType implements FoModel
{
  SkinType(this.id, this.label, this.symptomsRegistry);

  final String label;
  final List<SymptomMap> symptomsRegistry;

  @override
  String id;

  @override
  String status = "active";

  @override
  DateTime created = new DateTime.now();

  @override
  String added_by = "system";

  @override
  Map<dynamic, dynamic> toMap() => super.toMap();

  @override
  operator []=(Object key, dynamic value) => throw new UnsupportedError("Operator []= is not supported on SkinType");

  @override
  dynamic operator [](Object key) => throw new UnsupportedError("Operator []= is not supported on SkinType");
}

class SymptomMap
{
  SymptomMap
  ({
      this.open_comedones = null,
      this.closed_comedones = null,
      this.papules = null,
      this.pustules = null,
      this.cysts = null,
      this.nodules = null,
      this.seborrhea = null,
      this.rosacea = null,
      this.milia = null,
      this.pigmentation = null,
      this.surface_blood_vessels = null,
      this.acne_scars = null,
      this.texture = null
  });

  SymptomMap.decode(Map<String, dynamic> data)
  {
    open_comedones = data["open_comedones"];
    closed_comedones = data["closed_comedones"];
    papules = data["papules"];
    pustules = data["pustules"];
    cysts = data["cysts"];
    nodules = data["nodules"];
    seborrhea = data["seborrhea"];
    rosacea = data["rosacea"];
    milia = data["milia"];
    pigmentation = data["pigmentation"];
    surface_blood_vessels = data["surface_blood_vessels"];
    acne_scars = data["acne_scars"];
    texture = data["texture"];
  }

  @override
  bool operator == (dynamic other)
  {
    return
      other is SymptomMap &&
      open_comedones == other.open_comedones &&
      closed_comedones == other.closed_comedones &&
      papules == other.papules &&
      pustules == other.pustules &&
      cysts == other.cysts &&
      nodules == other.nodules &&
      seborrhea == other.seborrhea &&
      rosacea == other.rosacea &&
      milia == other.milia &&
      pigmentation == other.pigmentation &&
      surface_blood_vessels == other.surface_blood_vessels &&
      acne_scars == other.acne_scars &&
      texture == other.texture;
  }

  bool partialMatch(SymptomMap other)
  {
    Map<String, dynamic> firstEncoded = encoded;
    Map<String, dynamic> secondEncoded = other.encoded;
    Iterable<String> matches = firstEncoded.keys.where((key) => firstEncoded[key] == null || secondEncoded[key] == null || firstEncoded[key] == secondEncoded[key]);
    return matches.length == firstEncoded.length;
  }

  Map<String, dynamic> get encoded
  {
    return
    {
      "open_comedones" : open_comedones,
      "closed_comedones" : closed_comedones,
      "papules" : papules,
      "pustules" : pustules,
      "cysts" : cysts,
      "nodules" : nodules,
      "seborrhea" : seborrhea,
      "rosacea" : rosacea,
      "milia" : milia,
      "pigmentation" : pigmentation,
      "surface_blood_vessels" : surface_blood_vessels,
      "acne_scars" : acne_scars,
      "texture" : texture
    };
  }

  @override
  int get hashCode => JSON.encode(encoded).hashCode;

  int open_comedones;
  int closed_comedones;
  int papules;
  int pustules;
  int cysts;
  int nodules;
  int seborrhea;
  int rosacea;
  bool milia;
  bool pigmentation;
  bool surface_blood_vessels;
  bool acne_scars;
  String texture;
}