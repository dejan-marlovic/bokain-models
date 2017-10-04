import 'dart:async' show Future;
import 'package:angular/angular.dart' show Injectable;
import 'package:fo_components/fo_components.dart';
import '../api.bokain.se/restful_service_base.dart';

@Injectable()
class MailerService extends RestfulServiceBase
{
  MailerService(this._phraseService) : super();

  Future<Map<String, dynamic>> mail(String body, String subject, String to) async => await httpPOST("mail", {"body":body, "subject":subject, "to":to});

  String formatDatePronounced(DateTime date)
  {
    String weekday = _phraseService.get("weekday_${date.weekday}_pronounced");
    String day = _phraseService.get("${date.day}_pronounced");
    String month = _phraseService.get("month_${date.month}");

    return "$weekday $day $month ${date.year}";
  }

  String formatHM(DateTime date)
  {
    String hour = (date.hour < 10) ? "0" + date.hour.toString() : date.hour.toString();
    String minute = (date.minute < 10) ? "0" + date.minute.toString() : date.minute.toString();
    return "$hour:$minute";
  }

  final PhraseService _phraseService;
}