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
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 1, seborrhea: 0, rosacea: false),
      new SymptomMap(papules: 2, seborrhea: 0, rosacea: false),
      new SymptomMap(papules: 2, seborrhea: 1, rosacea: false),
      new SymptomMap(papules: 3, rosacea: false),
      new SymptomMap(pustules: 1, rosacea: false),
      new SymptomMap(pustules: 2, rosacea: false),
      new SymptomMap(pustules: 3, rosacea: false),
      new SymptomMap(cysts: 1, rosacea: false),
      new SymptomMap(cysts: 2, rosacea: false),
      new SymptomMap(cysts: 3, rosacea: false),
      new SymptomMap(nodules: 1, rosacea: false),
      new SymptomMap(nodules: 2, rosacea: false),
      new SymptomMap(nodules: 3, rosacea: false),
    ]),
    "2" : new SkinType("2", "combination_skin", []),
    "3" : new SkinType("3", "oily",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false, milia: false, surfaceBloodVessels: false, acneScars: false, texture: "oily")
    ]),
    "4" : new SkinType("4", "milia",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false, milia: true, pigmentation: false, surfaceBloodVessels: false, acneScars: false)
    ]),
    "5" : new SkinType("5", "pigmentation",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false, milia: false, pigmentation: true, surfaceBloodVessels: false, acneScars: false
      )
    ]),
    "7" : new SkinType("7", "comedones",
    [
      new SymptomMap(closedComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(closedComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(openComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(openComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(openComedones: 1, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(openComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(openComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(closedComedones: 1, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(closedComedones: 2, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(closedComedones: 3, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(closedComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(closedComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(closedComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(closedComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 2, rosacea: false),
      new SymptomMap(openComedones: 1, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(openComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(openComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false),
      new SymptomMap(openComedones: 2, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(openComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false),
      new SymptomMap(openComedones: 3, papules: 1, pustules: 0, cysts: 0, nodules: 0, seborrhea: 2, rosacea: false),
    ]),
    "8" : new SkinType("8", "rosacea",
    [
      new SymptomMap(rosacea: true, milia: false, pigmentation: false, surfaceBloodVessels: false, acneScars: false)
    ]),
    "9" : new SkinType("9", "seborrhea",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 1, rosacea: false, pigmentation: false, surfaceBloodVessels: false, acneScars: false),
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 2, rosacea: false, pigmentation: false, surfaceBloodVessels: false, acneScars: false),
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 3, rosacea: false, pigmentation: false, surfaceBloodVessels: false, acneScars: false),
    ]),
    "10" : new SkinType("10", "dry",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false, pigmentation: false, surfaceBloodVessels: false, acneScars: false, texture: "dry")
    ]),
    "11" : new SkinType("11", "surface_blood_vessels",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false, milia: false, pigmentation: false, surfaceBloodVessels: true, acneScars: false),
    ]),
    "12" : new SkinType("12", "acne_scars",
    [
      new SymptomMap(openComedones: 0, closedComedones: 0, papules: 0, pustules: 0, cysts: 0, nodules: 0, seborrhea: 0, rosacea: false, milia: false, pigmentation: false, surfaceBloodVessels: false, acneScars: true)
    ])
  };
}