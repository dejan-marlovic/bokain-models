import 'package:angular2/angular2.dart';

@Injectable()
class ErrorOutputService
{
  void set(String message, [String title = 'error_occurred'])
  {
    _message = message;
    _title = title;
    _open = true;
  }

  void set open(bool value)
  {
    _open = value;
    if (!_open)
    {
      _message = null;
      _title = null;
    }
  }

  String get message => _message;
  String get title => _title;
  bool get open => _open;

  String _title;
  String _message;
  bool _open = false;
}