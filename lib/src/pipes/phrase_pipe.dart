import 'package:angular2/di.dart' show Pipe, PipeTransform;
import 'package:bokain_models/bokain_models.dart' show PhraseService;

@Pipe("phrase")
class PhrasePipe implements PipeTransform
{
  PhrasePipe(this._phraseService);

  String transform(String value, [bool capitalize_first = true])
  {
    return _phraseService.get([value], capitalize_first: capitalize_first);
  }

  final PhraseService _phraseService;
}