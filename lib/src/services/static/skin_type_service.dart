import '../../static_model/skin_type.dart';
import 'package:angular/di.dart';

@Injectable()
class SkinTypeService
{
  SkinType get(String id) => _data.containsKey(id) ? _data[id] : null;

  Map<String, SkinType> get data => _data;

  final Map<String, SkinType> _data =
  {
    "1" : new SkinType("1", "acne"),
    "2" : new SkinType("2", "combination_skin"),
    "3" : new SkinType("3", "oily"),
    "4" : new SkinType("4", "milia"),
    "5" : new SkinType("6", "pigmentation"),
    "7" : new SkinType("7", "comedones"),
    "8" : new SkinType("8", "rosacea"),
    "9" : new SkinType("9", "seborrhea"),
    "10" : new SkinType("10", "dry"),
  };
}