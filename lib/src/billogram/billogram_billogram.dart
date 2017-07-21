part of 'billogram_base.dart';

class BillogramBillogram extends BillogramBase
{
  BillogramBillogram(BillogramCustomer customer, List<BillogramItem> items)
  {
    this.customer = customer;
    this.items = items;

    DateFormat df = new DateFormat("yyyy-MM-dd");
    _data["invoice_date"] = df.format(new DateTime.now());
    _data["due_days"] = 30;

  }

  void set customer(BillogramCustomer value)
  {
    _data["customer"] = new Map<String, dynamic>();//value._data;
    _data["customer"]["customer_no"] = value.customerNo;
    _data["customer"]["address"] = value.address;
  }

  void set items(List<BillogramItem> value)
  {
    _data["items"] = new List();
    for (BillogramItem item in value)
    {
      _data["items"].add(item._data);
    }
  }
}