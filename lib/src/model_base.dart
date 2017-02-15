library model_base;
import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart' show DateFormat;
part 'editable_model/editable_model.dart';
part 'editable_model/customer.dart';
part 'editable_model/room.dart';
part 'editable_model/salon.dart';
part 'editable_model/service.dart';
part 'editable_model/service_addon.dart';
part 'editable_model/user.dart';
part 'calendar/booking.dart';
part 'calendar/day.dart';

abstract class ModelBase
{
  ModelBase()
  {
    _data = new Map();
    created = new DateTime.now();
  }

  ModelBase.fromData(Map<String, dynamic> data)
  {
    _data = new Map.from(data);
    if (!_data.containsKey("created")) _data["created"] = new DateTime.now();
  }

  ModelBase.decode(Map<String, String> data)
  {
    created = DateTime.parse(data["created"]);
  }

  Map<String, String> encode()
  {
    Map<String, String> data = new Map();
    data["created"] = df.format(created);

    /// Auto-encode default type properties (String, DateTime, double, int, null)
    _data.forEach((key, value)
    {
      if (value is String) data[key] = value;
      else if (value is DateTime) data[key] = df.format(value);
      else if (value is num) data[key] = value.toString();
      else if (value == null) data[key] = null;
    });
    return data;
  }

  bool isEqual(ModelBase other) => _data.keys.every((key) => other._data.keys.contains(key) && _data[key] == other._data[key]);

  DateTime get created => _data["created"];
  void set created(DateTime value) { _data["created"] = value; }

  Map<String, dynamic> _data;
  static final DateFormat df = new DateFormat('y-MM-d H:mm:s');
}
