import '../../static_model/language.dart';
import 'package:angular/di.dart';
import 'package:fo_components/fo_components.dart' show PhraseService;

@Injectable()
class LanguageService
{
  LanguageService(PhraseService phraseService) : _data =
  {
    "1" : new Language("1", phraseService.get("swedish"), "sv"),
    "2" : new Language("2", phraseService.get("english"), "en"),
  };

  Language get(String id) => _data.containsKey(id) ? _data[id] : null;

  Map<String, Language> get data => _data;

  final Map<String, Language> _data;
}