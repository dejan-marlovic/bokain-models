gb  npart of model_base;

class Salon extends EditableModel
{
  @override
  Salon([String id = null]) : super(id)
  {
    roomIds = new List();
    userIds = new List();
    bookingIds = new List();
    logoUrls = new Map();
  }


  @override
  Salon.from(Salon other) : super.from(other);


  @override
  Salon.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
    for (String key in d.keys)
    {
      data[key] = d[key];
    }
    if (roomIds == null) roomIds = new List();
    if (userIds == null) userIds = new List();
    if (bookingIds == null) bookingIds = new List();
    if (logoUrls == null) logoUrls = new Map();
  }

  @override
  String toString() => name;

  @override
  List<String> get tableColumns => super.tableColumns..addAll(["name", "email", "phone", "city"]);

  String get name => data["name"];
  String get email => data["email"];
  String get phone => data["phone"];
  String get street => data["street"];
  String get postalCode => data["postal_code"];
  String get city => data["city"];
  /**
   * One url per company
   */
  Map<String, String> get logoUrls => data["logo_urls"];
  List<String> get roomIds => data["room_ids"];
  List<String> get userIds => data["user_ids"];
  List<String> get bookingIds => data["booking_ids"];

  void set name(String value) { data["name"] = value; }
  void set email(String value) { data["email"] = value; }
  void set phone(String value) { data["phone"] = value; }
  void set street(String value) { data["street"] = value; }
  void set postalCode(String value) { data["postal_code"] = value; }
  void set city(String value) { data["city"] = value; }

  /**
   * One url per company
   */
  void set logoUrls(Map<String, String> value) { data["logo_urls"] = value; }
  void set roomIds(List<String> value) { data["room_ids"] = value; }
  void set userIds(List<String> value) { data["user_ids"] = value; }
  void set bookingIds(List<String> value) { data["booking_ids"] = value; }
}