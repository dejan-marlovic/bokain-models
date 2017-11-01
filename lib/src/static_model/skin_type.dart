import 'package:fo_components/fo_components.dart';
import 'dart:convert';

class SkinType extends FoModel
{
  SkinType(String id, String name, this.symptomsRegistry) : super(id, name)
  {
  }

  final List<SymptomMap> symptomsRegistry;
}

class SymptomMap
{
  SymptomMap
  ({
      this.openComedones = null,
      this.closedComedones = null,
      this.papules = null,
      this.pustules = null,
      this.cysts = null,
      this.nodules = null,
      this.seborrhea = null,
      this.rosacea = null,
      this.milia = null,
      this.pigmentation = null,
      this.surfaceBloodVessels = null,
      this.acneScars = null,
      this.texture = null
  });


  @override
  bool operator == (dynamic other)
  {
    return
      other is SymptomMap &&
      openComedones == other.openComedones &&
      closedComedones == other.closedComedones &&
      papules == other.papules &&
      pustules == other.pustules &&
      cysts == other.cysts &&
      nodules == other.nodules &&
      seborrhea == other.seborrhea &&
      rosacea == other.rosacea &&
      milia == other.milia &&
      pigmentation == other.pigmentation &&
      surfaceBloodVessels == other.surfaceBloodVessels &&
      acneScars == other.acneScars &&
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
      "open_comedones" : openComedones,
      "closed_comedones" : closedComedones,
      "papules" : papules,
      "pustules" : pustules,
      "cysts" : cysts,
      "nodules" : nodules,
      "seborrhea" : seborrhea,
      "rosacea" : rosacea,
      "milia" : milia,
      "pigmentation" : pigmentation,
      "surface_blood_vessels" : surfaceBloodVessels,
      "acne_scars" : acneScars,
      "texture" : texture
    };
  }

  @override
  int get hashCode => JSON.encode(encoded).hashCode;

  int openComedones;
  int closedComedones;
  int papules;
  int pustules;
  int cysts;
  int nodules;
  int seborrhea;
  bool rosacea;
  bool milia;
  bool pigmentation;
  bool surfaceBloodVessels;
  bool acneScars;
  String texture;
}