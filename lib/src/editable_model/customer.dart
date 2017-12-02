part of model_base;

class Customer extends EditableModel
{
  @override
  Customer([String id = null]) : super(id)
  {
    Random rnd = new Random.secure();
    List<int> codeUnits = new List();
    for (int i = 0; i < 6; i++)
    {
      codeUnits.add(rnd.nextInt(30)+97);
    }
    password = new String.fromCharCodes(codeUnits);

    language = "1"; /// Swedish
    country = "1";  /// Sweden

    bookingIds = new List();
    journalEntryIds = new List();
  }

  @override
  Customer.from(Customer other) : super.from(other);

  @override
  Customer.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    for (String key in d.keys)
    {
      data[key] = d[key];
    }

    if (!data.containsKey("country")) country = "1";
    if (!data.containsKey("language")) language = "1";

    if (bookingIds == null) bookingIds = new List();
    if (journalEntryIds == null) journalEntryIds = new List();
  }

  @override
  List<String> get tableColumns => super.tableColumns..addAll(["firstname", "lastname", "email", "phone", "social_number"]);
  
  @override
  String toString() => email;

  int get age => data["age"];
  String get belongsTo => data["belongs_to"];
  String get careOf => data["care_of"];
  String get commentsExternal => data["comments_external"];
  String get commentsInternal => data["comments_internal"];
  String get consultationId => data["consultation_id"];
  String get city => data["city"];
  String get country => data["country"];
  String get email => data["email"];
  String get emailShop => data["email_shop"];
  String get firstname => data["firstname"];
  String get lastname => data["lastname"];
  String get phone => data["phone"];
  String get postalCode => data["postal_code"];
  String get language => data["language"];
  String get socialNumber => data["social_number"];
  String get street => data["street"];
  String get password => data["password"];
  String get sex => data["sex"];
  String get strAge => age == null ? "0" : age.toString();
  List<String> get bookingIds => data["booking_ids"];
  List<String> get journalEntryIds => data["journal_entry_ids"];

  /**
   * Temp for importing
   */
  String get afterImageUrl => data["after_image_url"];
  String get beforeImageUrl => data["before_image_url"];
  String get customerId => data["customer_id"];


  void set age(int value) { data["age"] = value; }
  void set belongsTo(String value) { data["belongs_to"] = value; }
  void set commentsExternal(String value) { data["comments_external"] = value; }
  void set commentsInternal(String value) { data["comments_internal"] = value; }
  void set careOf(String value){ data["care_of"] = value; }
  void set consultationId(String value) { data["consultation_id"] = value; }
  void set city(String value) { data["city"] = value; }
  void set country(String value) { data["country"] = value; }
  void set email(String value) { data["email"] = value; }
  void set emailShop(String value) { data["email_shop"] = value; }
  void set firstname(String value) { data["firstname"] = value; }
  void set lastname(String value) { data["lastname"] = value; }
  void set phone(String value) { data["phone"] = value; }
  void set postalCode(String value) { data["postal_code"] = value; }
  void set language(String value) { data["language"] = value; }
  void set socialNumber(String value) { data["social_number"] = value; }
  void set street(String value) { data["street"] = value; }
  void set password(String value) { data["password"] = value; }
  void set sex(String value) { data["sex"] = value; }
  void set strAge(String value) { try { age = int.parse(value); } on FormatException catch (e, s) { print(e); print(s); } }
  void set bookingIds(List<String> value) { data["booking_ids"] = value; }
  void set journalEntryIds(List<String> value) { data["journal_entry_ids"] = value; }

  /**
   * Temp for importing
   */
  void set afterImageUrl(String value) { data["after_image_url"] = value; }
  void set beforeImageUrl(String value) { data["before_image_url"] = value; }
  void set customerId(String value) { data["customer_id"] = value; }
}