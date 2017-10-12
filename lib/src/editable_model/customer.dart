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
    skinType = "7"; /// Normal

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
      _data[key] = d[key];
    }

    if (bookingIds == null) bookingIds = new List();
    if (journalEntryIds == null) journalEntryIds = new List();
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new  Map();
    table["name"] = "$firstname $lastname";
    table["email"] = email;
    table["phone"] = phone;
    table["social_number"] = socialNumber;
    table["status"] = status;
    return table;
  }

  @override
  String toString() => email;

  int get age => _data["age"];
  String get belongsTo => _data["belongs_to"];
  String get careOf => _data["care_of"];
  String get commentsExternal => _data["comments_external"];
  String get commentsInternal => _data["comments_internal"];
  String get consultationId => _data["consultation_id"];
  String get city => _data["city"];
  String get country => _data["country"];
  String get email => _data["email"];
  String get emailShop => _data["email_shop"];
  String get firstname => _data["firstname"];
  String get lastname => _data["lastname"];
  String get phone => _data["phone"];
  String get postalCode => _data["postal_code"];
  String get language => _data["language"];
  String get skinType => _data["skin_type"];
  String get socialNumber => _data["social_number"];
  String get street => _data["street"];
  String get password => _data["password"];
  String get sex => _data["sex"];
  String get strAge => age == null ? "0" : age.toString();
  List<String> get bookingIds => _data["booking_ids"];
  List<String> get journalEntryIds => _data["journal_entry_ids"];

  void set age(int value) { _data["age"] = value; }
  void set belongsTo(String value) { _data["belongs_to"] = value; }
  void set commentsExternal(String value) { _data["comments_external"] = value; }
  void set commentsInternal(String value) { _data["comments_internal"] = value; }
  void set careOf(String value){ _data["care_of"] = value; }
  void set consultationId(String value) { _data["consultation_id"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set country(String value) { _data["country"] = value; }
  void set email(String value) { _data["email"] = value; }
  void set emailShop(String value) { _data["email_shop"] = value; }
  void set firstname(String value) { _data["firstname"] = value; }
  void set lastname(String value) { _data["lastname"] = value; }
  void set phone(String value) { _data["phone"] = value; }
  void set postalCode(String value) { _data["postal_code"] = value; }
  void set language(String value) { _data["language"] = value; }
  void set skinType(String value) { _data["skin_type"] = value; }
  void set socialNumber(String value) { _data["social_number"] = value; }
  void set street(String value) { _data["street"] = value; }
  void set password(String value) { _data["password"] = value; }
  void set sex(String value) { _data["sex"] = value; }
  void set strAge(String value) { try { age = int.parse(value); } on FormatException catch (e, s) { print(e); print(s); } }
  void set bookingIds(List<String> value) { _data["booking_ids"] = value; }
  void set journalEntryIds(List<String> value) { _data["journal_entry_ids"] = value; }
}