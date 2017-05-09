class Phrase
{
  String get(List<String> phrase_keys, { Map<String, String> params : null, String separator : " ", bool capitalize_first : true})
  {
    List<String> phraseValues = new List();
    for (String key in phrase_keys)
    {
      if (key == null) return "";
      String value = key = key.toLowerCase();

      if (_phraseData.containsKey(key))
      {
        value = _phraseData[key];
        params?.forEach((paramName, paramVal)
        {
          value = value.replaceAll("%$paramName%", paramVal);
        });
      }
      phraseValues.add(value);
    }
    String phrase = phraseValues.join(separator);
    if (capitalize_first == true) phrase = phrase[0].toUpperCase() + phrase.substring(1, phrase.length);

    return phrase;
  }

  final Map<String, String> _phraseData =
  {
    "1_pronounced" : "1:a",
    "2_prounounced" : "2:a",
    "3_pronounced" : "3:e",
    "4_pronounced" : "4:e",
    "5_pronounced" : "5:e",
    "6_pronounced" : "6:e",
    "7_pronounced" : "7:e",
    "8_pronounced" : "8:e",
    "9_pronounced" : "9:e",
    "10_pronounced" : "10:e",
    "11_pronounced" : "11:e",
    "12_pronounced" : "12:e",
    "13_pronounced" : "13:e",
    "14_pronounced" : "14:e",
    "15_pronounced" : "15:e",
    "16_pronounced" : "16:e",
    "17_pronounced" : "17:e",
    "18_pronounced" : "18:e",
    "19_pronounced" : "19:e",
    "20_pronounced" : "20:e",
    "21_pronounced" : "21:a",
    "22_pronounced" : "22:a",
    "23_pronounced" : "23:e",
    "24_pronounced" : "24:e",
    "25_pronounced" : "25:e",
    "26_pronounced" : "26:e",
    "27_pronounced" : "27:e",
    "28_pronounced" : "28:e",
    "29_pronounced" : "29:e",
    "30_pronounced" : "30:e",
    "31_pronounced" : "31:a",
    "32_pronounced" : "32:a",
    "active" : "aktiv",
    "add" : "lägg till",
    "associate" : "anslut",
    "associated" : "ansluten",
    "associated_plural" : "anslutna",
    "at" : "på",
    "belongs_to" : "tillhör",
    "book" : "boka in",
    "bookable_plural" : "bokningsbara",
    "booking" : "bokning",
    "booking_cancel" : "avboka",
    "booking_cancellation" : "avbokning",
    "booking_confirm" : "bekräfta bokning",
    "booking_confirm_text" :  "kontrollera att uppgifterna ovan stämmer innan du slutför bokningen",
    "booking_confirmation" : "bokningsbekräftelse",
    "booking_confirmation_send" : "skicka bokningsbekräftelse till kunden",
    "booking_details" : "bokningsinformation",
    "booking_history" : "bokningshistorik",
    "booking_mode" : "bokningsläge",
    "booking_plural" : "bokningar",
    "booking_rank" : "bokningsranking",
    "break" : "rast",
    "calendar" : "kalender",
    "cancel" : "avbryt",
    "category" : "kategori",
    "city" : "stad",
    "close" : "stäng",
    "confirm" : "bekräfta",
    "confirm_remove" : "bekräfta borttagning av objekt",
    "confirm_save" : "du har osparade ändringar, tryck OK för att spara eller AVBRYT för att ignorera ändringarna",
    "comments_external" : "kommentarer (externa)",
    "comments_internal" : "kommentarer (interna)",
    "country" : "land",
    "country_gb" : "storbritannien",
    "country_se" : "sverige",
    "currency" : "kr",
    "customer" : "kund",
    "customer_plural" : "kunder",
    "customer_details" : "kunduppgifter",
    "dashboard" : "dashboard",
    "delete" : "ta bort",
    "description" : "beskrivning",
    "details" : "uppgifter",
    "disabled" : "inaktiverad",
    "duration" : "varaktighet",
    "duration_minutes" : "varaktighet (minuter)",
    "dynamic_time" : "dynamisk tid",
    "edit" : "redigera",
    "email" : "e-post",
    "email_pronounced" : "denna e-post",
    "entry" : "inlägg",
    "error_occured" : "ett fel inträffade",
    "finish" : "slutför",
    "friday" : "fredag",
    "in_minutes" : "(minuter)",
    "information" : "information",
    "firstname" : "förnamn",
    "frozen" : "fryst",
    "function" : "funktion",
    "language" : "språk",
    "language_en" : "engelska",
    "language_sv" : "svenska",
    "lastname" : "efternamn",
    "login" : "logga in",
    "monday" : "måndag",
    "month" : "månad",
    "month_1" : "januari",
    "month_2" : "februari",
    "month_3" : "mars",
    "month_4" : "april",
    "month_5" : "maj",
    "month_6" : "juni",
    "month_7" : "juli",
    "month_8" : "augusti",
    "month_9" : "september",
    "month_10" : "oktober",
    "month_11" : "november",
    "month_12" : "december",
    "name" : "namn",
    "name_pronounced" : "detta namn",
    "new_booking" : "ny bokning",
    "new_customer" : "ny kund",
    "new_room" : "nytt rum",
    "new_salon" : "ny salong",
    "new_service" : "ny tjänst",
    "new_service_addon" : "ny tilläggstjänst",
    "new_user" : "ny användare",
    "next" : "nästa",
    "no_results" : "inga resultat",
    "none" : "inget",
    "not" : "ej",
    "only" : "enbart",
    "open" : "öppna",
    "order_history" : "orderhistorik",
    "password" : "lösenord",
    "phone" : "telefon",
    "pick" : "välj",
    "picture" : "bild",
    "picture_plural" : "bilder",
    "postal_code" : "postnummer",
    "previous" : "föregående",
    "price" : "pris",
    "rebook" : "omboka",
    "rebooking" : "ombokning",
    "room" : "rum",
    "room_plural" : "rum",
    "room_pronounced" : "detta rum",
    "salon" : "salong",
    "salon_details" : "salongens uppgifter",
    "salon_plural" : "salonger",
    "saturday" : "lördag",
    "save" : "spara",
    "schedule" : "schema",
    "schedule_mode" : "schemaläge",
    "search" : "sök",
    "selection_state" : "markeringsläge",
    "send_email_notification" : "skicka e-post notifikation",
    "service" : "tjänst",
    "service_addon" : "tilläggstjänst",
    "service_addon_details" : "tillängstjänstens uppgifter",
    "service_addon_plural" : "tilläggstjänster",
    "service_details" : "tjänstens uppgifter",
    "service_plural" : "tjänster",
    "sick" : "sjuk",
    "skin_consultation" : "hudkonsultation",
    "skin_type" : "hudtyp",
    "skin_type_acne" : "akne",
    "skin_type_aging" : "åldrande",
    "skin_type_combination_skin" : "blandhy",
    "skin_type_oily" : "fet hy",
    "skin_type_sensitive" : "känslig hy",
    "skin_type_milia" : "milier",
    "skin_type_normal" : "normal hy",
    "skin_type_pigmentation" : "pigmentfläckar",
    "skin_type_comedones" : "pormaskar",
    "skin_type_rosacea" : "rosacea",
    "skin_type_seborrhea" : "seborré",
    "skin_type_sun_damaged" : "solskadad hy",
    "skin_type_dry" : "torr hy",
    "social_number" : "personnummer",
    "social_number_pronounced" : "detta personnummer",
    "start_time" : "starttid",
    "street" : "gatuadress",
    "sunday" : "söndag",
    "thursday" : "torsdag",
    "time" : "tid",
    "times" : "tider",
    "tuesday" : "tisdag",
    "user" : "användare",
    "user_plural" : "användare",
    "user_details" : "användaruppgifter",
    "warning" : "varning",
    "wednesday" : "onsdag",
    "week" : "vecka",
    "weekday_1_pronounced" : "måndagen den",
    "weekday_2_pronounced" : "tisdagen den",
    "weekday_3_pronounced" : "onsdagen den",
    "weekday_4_pronounced" : "torsdagen den",
    "weekday_5_pronounced" : "fredagen den",
    "weekday_6_pronounced" : "lördagen den",
    "weekday_7_pronounced" : "söndagen den",
    "_could_not_save_model" : "Kunde inte spara %model%.",
    "_customer_with_this_email_already_exists" : "Det finns redan en kund med denna e-post",
    "_customer_with_this_phone_already_exists" : "Det finns redan en kund med detta telefonnummer",
    "_customer_with_this_social_number_already_exists" : "Det finns redan en kund med detta personnummer",
    "_delete_are_you_sure" : "Är du säker på att du vill ta bort %model%? Operationen går inte att ångra.",
    "_email_cancel_booking" : '<table class="text-center"><tr><th><h1 class="text-center">Avbokning</h1><h2 class="text-center">Hej %customer_name%!</h2><p class="text-center">Nedanstående tid har nu avbokats</p><h2 class="text-center">%service_name%</h2><p class="text-center">%salon_name%<br/>%salon_address%</p><p class="text-center">%date%</p><p class="text-center">kl %start_time%-%end_time%</p><p class="text-center">Utövare: %user_name%</p> </tr></table>',
    "_email_new_booking" : '<table class="text-center"><tr><th><h1 class="text-center">Bokningsbekräftelse</h1><h2 class="text-center">Hej %customer_name%!</h2><p class="text-center">Vi har tagit emot din bokning enligt nedan</p><h2 class="text-center">%service_name%</h2><p class="text-center">%salon_name%<br/>%salon_address%</p><p class="text-center">%date%</p><p class="text-center">kl %start_time%-%end_time%</p><p class="text-center">Utövare: %user_name%</p><h4 class="text-center">Välkommen!</h4></tr></table>',
    "_email_reschedule_booking" : '<table class="text-center"><tr><th><h1 class="text-center">Bokningsbekräftelse</h1><h2 class="text-center">Hej %customer_name%!</h2><p class="text-center">Din tid har blivit ombokad enligt nedan</p><h2 class="text-center">%service_name%</h2><p class="text-center">%salon_name%<br/>%salon_address%</p><p class="text-center">%date%</p><p class="text-center">kl %start_time%-%end_time%</p><p class="text-center">Utövare: %user_name%</p><h4 class="text-center">Välkommen!</h4></tr></table>',
    "_enter_alphabet_characters_only" : "enbart bokstäver är tillåtna i detta fält",
    "_enter_alpha_numeric_values_only" : "enbart bokstäver och siffror är tillåtna i detta fält",
    "_enter_numbers_only" : "enbart siffror är tillåtna i detta fält",
    "_enter_valid_phone_without_spaces" : "Ange ett giltigt telefonnummer utan mellanslag (123456789)",
    "_enter_valid_swedish_cellphone_without_spaces" : "Ange ett giltigt mobilnummer utan mellanslag (0712345678)",
    "_enter_valid_swedish_ssn" : "Ange ett giltigt svenskt personnummer utan mellanslag eller bindestreck (YYYYMMDDXXXX)",
    "_enter_valid_cancel_booking_code" : "Ange en giltig bokningskod (ABC123)",
    "_salon_is_closed_this_week" : "det finns inga öppna tider för salongen denna vecka",
    "_salon_with_this_name_already_exists" : "Det finns redan en salong med detta namn",
    "_service_with_this_name_already_exists" : "Det finns redan en tjänst med detta namn",
    "_service_addon_with_this_name_already_exists" : "Det finns redan en tilläggstjänst med detta namn",
    "_ui_name_service_addon" : "%name% [%duration% min, %price% kr]",
    "_user_with_this_email_already_exists" : "Det finns redan en användare med denna e-post",
    "_user_with_this_phone_already_exists" : "Det finns redan en användare med detta telefonnummer",
    "_user_with_this_social_number_already_exists" : "Det finns redan en användare med detta personnummer",
    "_Error: The email address is already in use by another account." : "Det finns redan en användare med denna e-post.",
    "_Error: Password should be at least 6 characters" : "Lösenordet måste innehålla minst 6 tecken",
  };
}