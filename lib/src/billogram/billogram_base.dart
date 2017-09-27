library billogram_base;
import 'dart:convert';
import 'package:intl/intl.dart';
part 'billogram_address.dart';
part 'billogram_billogram.dart';
part 'billogram_contact.dart';
part 'billogram_customer.dart';
part 'billogram_item.dart';

class BillogramBase
{
  String toJSON() => JSON.encode(_data);

  Map<String, dynamic> get data => _data;

  Map<String, dynamic> _data = new Map();
}