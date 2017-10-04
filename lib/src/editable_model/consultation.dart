part of model_base;

class Consultation extends EditableModel
{
  @override
  Consultation([String id = null]) : super(id);

  @override
  Consultation.decode(String id, Map<String, dynamic> d) : super.decode(id, d)
  {
  }

  @override
  Map<String, String> toTableRow()
  {
    Map<String, String> table = new Map();
    table["created"] = ModelBase.timestampFormat(created);
    return table;
  }


  String get customerId => _data["customer_id"];

  void set customerId(String value) { _data["customer_id"] = value; }
}
