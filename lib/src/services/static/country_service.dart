import '../../static_model/country.dart';
import 'package:angular/di.dart';

@Injectable()
class CountryService
{
  Country get(String id) => _data.containsKey(id) ? _data[id] : null;

  Map<String, Country> get data => _data;

  final Map<String, Country> _data =
  {
    "1" : new Country("1", "sweden", "se"),
  };
}