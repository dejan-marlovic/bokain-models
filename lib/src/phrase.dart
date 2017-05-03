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
    "active" : "aktiv",
    "add" : "lägg till",
    "addon_services" : "tilläggstjänster",
    "associate" : "anslut",
    "associated" : "ansluten",
    "associated_plural" : "anslutna",
    "at" : "på",
    "belongs_to" : "tillhör",
    "book" : "boka in",
    "bookable_plural" : "bokningsbara",
    "booking" : "bokning",
    "booking_cancel" : "avboka",
    "booking_confirm" : "bekräfta bokning",
    "booking_confirm_text" :  "kontrollera att uppgifterna ovan stämmer innan du slutför bokningen",
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
    "_could_not_save_model" : "Kunde inte spara %model%.",
    "_delete_are_you_sure" : "Är du säker på att du vill ta bort %model%? Operationen går inte att ångra.",
    "_salon_is_closed_this_week" : "det finns inga öppna tider för salongen denna vecka",
    "_ui_name_service_addon" : "%name% [%duration% min, %price% kr]",
    "_unique_database_value_exists" : "Det finns redan ett objekt med %property_pronounced% i systemet",
    "_Error: The email address is already in use by another account." : "Det finns redan en användare med denna e-post.",
    "_Error: Password should be at least 6 characters" : "Lösenordet måste innehålla minst 6 tecken",
  };
}