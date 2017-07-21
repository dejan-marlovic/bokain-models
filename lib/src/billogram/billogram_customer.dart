part of 'billogram_base.dart';

class BillogramCustomer extends BillogramBase
{
  BillogramCustomer(String org_no, String name, BillogramContact contact, BillogramAddress address)
  {
    this.orgNo = org_no;
    this.name = name;
    this.contact = contact._data;
    this.address = address._data;
    _data["company_type"] = "individual";
  }

  int customerNo = null;

  String get orgNo => _data["org_no"];
  String get name => _data["name"];
  Map<String, String> get contact => _data["contact"];
  Map<String, dynamic> get address => _data["address"];

  void set orgNo(String value) { _data["org_no"] = value; }
  void set name(String value) { _data["name"] = value; }
  void set contact(Map<String, String> value) { _data["contact"] = value; }
  void set address(Map<String, dynamic> value) { _data["address"] = value; }

}