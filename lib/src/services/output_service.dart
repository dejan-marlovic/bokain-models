import 'package:angular/angular.dart';

@Injectable()
class OutputService
{
  void set(String message, [String title = 'error_occurred', String error = null])
  {
    _title = title;
    _message = message;
    _error = error;
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

  String get error => _error;
  String get message => _message;
  String get title => _title;
  bool get open => _open;

  String _title;
  String _message;
  String _error;
  bool _open = false;
}