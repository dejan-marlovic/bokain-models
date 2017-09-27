import 'package:angular_forms/angular_forms.dart';
import 'package:bokain_models/bokain_models.dart';
import 'package:fo_components/fo_components.dart';

class BoValidators
{
  static ValidatorFn unique(String property, String error_phrase, FirebaseServiceBase service, EditableModel model)
  {
    return (AbstractControl control)
    {
      if ((FoValidators.required())(control) != null || service == null) return null;

      List<EditableModel> models = service.getAllByPropertyAsList(property, control.value).toList();
      if (model.id != null) models.removeWhere((m) => m.id == model.id);
      if (models.isEmpty) return null;
      else
      {
        PhraseService ps = new PhraseService();
        return {"error" : ps.get(error_phrase)};
      }
    };
  }
  
  static Map<String, String> cancelBookingCode(AbstractControl control)
  {
    if ((FoValidators.required()(control)) != null) return null;

    RegExp r = new RegExp("[A-Z]{3}[0-9]{3}");
    if (r.allMatches(control.value).length != control.value.length)
    {
      PhraseService ps = new PhraseService();
      return {"error" : ps.get("enter_valid_cancel_booking_code")};
    }
    else return null;
  }
}