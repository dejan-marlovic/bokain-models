part of model_base;

class Customer extends EditableModel
{
  @override
  Customer() : super()
  {
    Random rnd = new Random.secure();
    List<int> codeUnits = new List();
    for (int i = 0; i < 6; i++)
    {
      codeUnits.add(rnd.nextInt(30)+97);
    }
    password = new String.fromCharCodes(codeUnits);
  }

  @override
  Customer.fromData(Map<String, dynamic> data) : super.fromData(data);

  @override
  Customer.decode(Map<String, String> data) : super.decode(data)
  {
    /// It's all strings atm
    DateTime c = created;
    _data = new Map.from(data);
    _data["created"] = c;
  }

  String get belongsTo => _data["belongs_to"];
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
  String get postalCode => _data["postalCode"];
  String get preferredLanguage => _data["preferred_language"];
  String get skinType => _data["skin_type"];
  String get socialNumber => _data["social_number"];
  String get street => _data["street"];
  String get password => _data["password"];

  void set belongsTo(String value) { _data["belongs_to"] = value; }
  void set commentsExternal(String value) { _data["comments_external"] = value; }
  void set commentsInternal(String value) { _data["comments_internal"] = value; }
  void set consultationId(String value) { _data["consultation_id"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set country(String value) { _data["country"] = value; }
  void set email(String value) { _data["email"] = value; }
  void set emailShop(String value) { _data["email_shop"] = value; }
  void set phone(String value) { _data["phone"] = value; }
  void set postalCode(String value) { _data["postal_code"] = value; }
  void set preferredLanguage(String value) { _data["preferred_language"] = value; }
  void set skinType(String value) { _data["skin_type"] = value; }
  void set socialNumber(String value) { _data["social_number"] = value; }
  void set street(String value) { _data["street"] = value; }
  void set password(String value) { _data["password"] = value; }
}