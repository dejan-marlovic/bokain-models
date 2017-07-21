part of 'billogram_base.dart';

class BillogramContact extends BillogramBase
{
  BillogramContact(String email, String phone)
  {
    this.email = email;
    this.phone = phone;
  }

  String get email => _data["email"];
  String get phone => _data["phone"];

  void set email(String value) { _data["email"] = value; }
  void set phone(String value) { _data["phone"] = value; }
}