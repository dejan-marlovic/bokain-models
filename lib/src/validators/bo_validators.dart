import 'package:angular2/angular2.dart' show ValidatorFn, AbstractControl;
import 'package:bokain_models/src/services/firebase/firebase_service_base.dart';
import 'package:bokain_models/src/model_base.dart' show EditableModel;
import 'package:bokain_models/bokain_models.dart' show Phrase;

class BoValidators
{
  static ValidatorFn unique(String property, String error_phrase, FirebaseServiceBase service, EditableModel model)
  {
    return (AbstractControl control)
    {
      if (required(control) != null || service == null) return null;

      List<String> ids = service.getIdsByProperty(property, control.value);
      if (model != null) ids.removeWhere((id) => id == model.id);

      return (ids.isEmpty) ? null : {"error" : _phrase.get([error_phrase])};
    };
  }

  static Map<String, String> required(AbstractControl control)
  {
    return control.value == null || control.value == '' ? {"error": _phrase.get(["_enter_a_value"])} : null;
  }

  static Map<String, String> isAlpha(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();

    RegExp r = new RegExp(r"[a-zA-ZåäöÅÄÖ]");

    if (r.allMatches(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_alphabet_characters_only"]);
    }
    return output;
  }

  static Map<String, String> isName(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();

    RegExp r = new RegExp(r"[a-zA-ZåäöÅÄÖ\- ]");
    if (r.allMatches(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_alphabet_characters_only"]);
    }
    return output;
  }

  static Map<String, String> isAlphaNumeric(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();

    RegExp r = new RegExp(r"[a-zA-ZåäöÅÄÖ0-9 ]");
    if (r.allMatches(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_alpha_numeric_values_only"]);
    }
    return output;
  }

  static Map<String, String> isNumeric(AbstractControl control)
  {
    if (control.value is num) return null;

    else
    {
      try
      {
        num.parse(control.value);
      }
      on FormatException
      {
        return {"error" : _phrase.get(['_enter_numbers_only'])};
      }
      return null;
    }
  }

  static ValidatorFn numericMax(num max)
  {
    return (AbstractControl control)
    {
      if (isNumeric(control) != null) return null;
      return control.value <= max ? null : {"error":_phrase.get(["_numeric_max_exceeded"], params: {"max":max.toString()})};
    };
  }

  static ValidatorFn numericMin(num min)
  {
    return (AbstractControl control)
    {
      if (isNumeric(control) != null) return null;
      return control.value >= min ? null : {"error":_phrase.get(["_numeric_min_exceeded"], params: {"min":min.toString()})};
    };
  }

  static Map<String, String> isPhoneNumber(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();
    RegExp r = new RegExp("[\+]{0,1}[0-9\- ]{7,32}");
        
    if (r.stringMatch(value) == null || r.stringMatch(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_valid_phone"]); // (+46)8 123 456
    }
    return output;
  }

  static Map<String, String> isSwedishCellphoneNumber(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();

    RegExp r = new RegExp("07[0-9]{8}");
    if (r.stringMatch(value) == null || r.stringMatch(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_valid_swedish_cellphone_without_spaces"]); // (0712345678)
    }
    return output;
  }

  static Map<String, String> isSwedishSocialSecurityNumber(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();
    RegExp r = new RegExp("(19|20)[0-9]{2,2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-2])[0-9]{4,4}");
    if (r.stringMatch(value) == null || r.stringMatch(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_valid_swedish_ssn"]); // (YYYYMMDDXXXX)
    }
    return output;
  }

  static Map<String, String> isCancelBookingCode(AbstractControl control)
  {
    if (required(control) != null) return null;
    String value = control.value;
    Map<String, String> output = new Map();
    RegExp r = new RegExp("[A-Z]{3}[0-9]{3}");
    if (r.stringMatch(value) == null || r.stringMatch(value).length != value.length)
    {
      output["error"] = _phrase.get(["_enter_valid_cancel_booking_code"]); // ABC123
    }
    return output;
  }

  static Phrase _phrase = new Phrase();
}