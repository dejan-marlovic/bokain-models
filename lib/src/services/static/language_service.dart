import '../../static_model/language.dart';
import 'package:angular/di.dart';

@Injectable()
class LanguageService
{
  Language get(String id) => _data.containsKey(id) ? _data[id] : null;

  Map<String, Language> get data => _data;

  final Map<String, Language> _data =
  {
    "1" : new Language("1", "swedish", "sv"),
    "2" : new Language("2", "english", "en"),
  };
}