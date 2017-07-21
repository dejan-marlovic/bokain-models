part of 'billogram_base.dart';

class BillogramItem extends BillogramBase
{
  BillogramItem(String title, String description, num price)
  {
    /// For our purposes (no-shows), the invoice will only contain one item
    _data["count"] = 1;
    _data["unit"] = "unit";
    _data["vat"] = 25;

    this.title = title;
    this.description = description;
    this.price = price;
  }

  void set title(String value)
  {
    if (value != null && value.length > 40) throw new RangeError("Max 40 characters");
    _data["title"] = value;
  }

  void set description(String value)
  {
    if (value != null && value.length > 200) throw new RangeError("Max 200 characters");
    _data["description"] = value;
  }

  void set price(num value) { _data["price"] = value.toDouble(); }


}