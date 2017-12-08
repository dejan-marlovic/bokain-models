import '../../static_model/country.dart';
import 'package:angular/di.dart';
import 'package:fo_components/fo_components.dart' show PhraseService;

@Injectable()
class CountryService
{
  CountryService(PhraseService phraseService) : _data =
  {
    "1" : new Country("1", phraseService.get("sweden"), "se"),
  };

  Country get(String id) => _data.containsKey(id) ? _data[id] : null;

  Map<String, Country> get data => _data;

  final Map<String, Country> _data;
}