import '../../static_model/skin_type.dart';
import 'package:angular/di.dart';

@Injectable()
class SkinTypeService
{
  SkinType get(String id) => _data.containsKey(id) ? _data[id] : null;

  Map<String, SkinType> get data => _data;


  final Map<String, SkinType> _data =
  {
    "1" : new SkinType("1", "acne",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 1, seborrhea: 0, rosacea: 0),
      new SymptomMap(papules: 2, seborrhea: 0, rosacea: 0),
      new SymptomMap(papules: 2, seborrhea: 1, rosacea: 0),
      new SymptomMap(papules: 3, rosacea: 0),
      new SymptomMap(pustules: 1, rosacea: 0),
      new SymptomMap(pustules: 2, rosacea: 0),
      new SymptomMap(pustules: 3, rosacea: 0),
      new SymptomMap(cysts: 1, rosacea: 0),
      new SymptomMap(cysts: 2, rosacea: 0),
      new SymptomMap(cysts: 3, rosacea: 0),
      new SymptomMap(nodules: 1, rosacea: 0),
      new SymptomMap(nodules: 2, rosacea: 0),
      new SymptomMap(nodules: 3, rosacea: 0),
    ]),
    "2" : new SkinType("2", "combination_skin", []),
    "3" : new SkinType("3", "oily",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0, milia: false, surfaceBloodVessels: false, acneScars: false, texture: "oily")
    ]),
    "4" : new SkinType("4", "milia",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0, milia: true, pigmentation: false, surfaceBloodVessels: false, acneScars: false)
    ]),
    "5" : new SkinType("5", "pigmentation",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0, milia: false, pigmentation: true, surfaceBloodVessels: false, acneScars: false
      )
    ]),
    "7" : new SkinType("7", "comedones",
    [
      new SymptomMap(closedComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(closedComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(openComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(openComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(openComedones: 1, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(openComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(openComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(closedComedones: 1, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(closedComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(closedComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(closedComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(closedComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(closedComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(closedComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 2, rosacea: 0),
      new SymptomMap(openComedones: 1, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(openComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(openComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0),
      new SymptomMap(openComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(openComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0),
      new SymptomMap(openComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 2, rosacea: 0),
    ]),
    "8" : new SkinType("8", "rosacea",
    [
      new SymptomMap(rosacea: 1),
      new SymptomMap(rosacea: 2),
      new SymptomMap(rosacea: 3)
    ]),
    "9" : new SkinType("9", "seborrhea",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: 0, pigmentation: false, surfaceBloodVessels: false, acneScars: false),
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 2, rosacea: 0, pigmentation: false, surfaceBloodVessels: false, acneScars: false),
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 3, rosacea: 0, pigmentation: false, surfaceBloodVessels: false, acneScars: false),
    ]),
    "10" : new SkinType("10", "dry",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0, pigmentation: false, surfaceBloodVessels: false, acneScars: false, texture: "dry")
    ]),
    "11" : new SkinType("11", "surface_blood_vessels",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0, milia: false, pigmentation: false, surfaceBloodVessels: true, acneScars: false),
    ]),
    "12" : new SkinType("12", "acne_scars",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: 0, milia: false, pigmentation: false, surfaceBloodVessels: false, acneScars: true)
    ])
  };

  final Map<String, int> symptomScoreRegistry =
  {
    "open_comedones" : 1,
    "closed_comedones" : 1,
    "papules" : 2,
    "pustules" : 3,
    "cysts" : 5,
    "nodules" : 5,
    "texture_dry" : -1,
    "texture_oily" : 1
  };
}