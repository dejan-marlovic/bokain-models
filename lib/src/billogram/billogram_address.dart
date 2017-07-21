part of 'billogram_base.dart';

class BillogramAddress extends BillogramBase
{
  BillogramAddress(String street, String city, String zip, String country, String careof)
  {
    this.streetAddress = street;
    this.city = city;
    this.zipcode = zip;
    this.country = country;
    this.careof = careof;
  }

  String get streetAddress => _data["street_address"];
  String get city => _data["city"];
  String get zipcode => _data["zipcode"];
  String get country => _data["country"];
  String get careof => _data["careof"];

  void set streetAddress(String value) { _data["street_address"] = value; }
  void set city(String value) { _data["city"] = value; }
  void set zipcode(String value) { _data["zipcode"] = value; }
  void set country(String value) { _data["country"] = value; }
  void set careof(String value) { _data["careof"] = value; }
}