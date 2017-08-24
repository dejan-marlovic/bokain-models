import 'package:angular2/angular2.dart' show ValidatorFn, AbstractControl;
import 'package:bokain_models/src/services/firebase/firebase_service_base.dart';
import 'package:bokain_models/src/model_base.dart' show EditableModel;
import 'package:fo_components/fo_components.dart' show FoValidators, PhraseService;

class BoValidators
{
  static ValidatorFn unique(String property, String error_phrase, FirebaseServiceBase service, EditableModel model)
  {
    return (AbstractControl control)
    {
      if (FoValidators.required(control) != null || service == null) return null;

      PhraseService ps = new PhraseService();

      List<String> ids = service.getIdsByProperty(property, control.value);
      if (model != null) ids.removeWhere((id) => id == model.id);
      return (ids.isEmpty) ? null : {"error" : ps.get(error_phrase)};
    };
  }

  /*
  static Map<String, String> cancelBookingCode(AbstractControl control)
  {
    if (FoValidators.required(control) != null) return null;

    RegExp r = new RegExp("[A-Z]{3}[0-9]{3}");
    if (r.allMatches(control.value).length != control.value.length)
    {
      PhraseService ps = new PhraseService();
      return {"error" : ps.get("enter_valid_cancel_booking_code")};
    }
    else return null;
  }
  */
}