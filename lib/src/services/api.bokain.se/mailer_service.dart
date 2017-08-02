import 'dart:async' show Future;
import 'package:angular2/angular2.dart' show Injectable;
import 'package:bokain_models/bokain_models.dart' show PhraseService;
import 'package:bokain_models/src/services/api.bokain.se/restful_service_base.dart';

@Injectable()
class MailerService extends RestfulServiceBase
{
  MailerService(this._phraseService) : super();

  Future<Map<String, dynamic>> mail(String body, String subject, String to) async => await httpPOST("mail", {"body":body, "subject":subject, "to":to});

  String formatDatePronounced(DateTime date)
  {
    return _phraseService.get(
        [
          'weekday_${date.weekday}_pronounced',
          '${date.day}_pronounced',
          'month_${date.month}'
        ]) + " " + date.year.toString();
  }

  String formatHM(DateTime date)
  {
    String hour = (date.hour < 10) ? "0" + date.hour.toString() : date.hour.toString();
    String minute = (date.minute < 10) ? "0" + date.minute.toString() : date.minute.toString();
    return "$hour:$minute";
  }

  final PhraseService _phraseService;
}