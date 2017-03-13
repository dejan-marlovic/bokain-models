library model_base;
import 'dart:math';
import 'package:collection/collection.dart';
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

  ModelBase.from(ModelBase other)
  {
    _data = deepCopy(other._data);
    if (!_data.containsKey("created")) _data["created"] = new DateTime.now();
  }

  ModelBase.decode(Map<String, dynamic> d)
  {
    _data = new Map();
    created = df.parse(d["created"]);
  }

  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> d = new Map();

    /// Auto-encode default type properties (String, DateTime, num, null)
    _data.forEach((key, value)
    {
      if (value is String || value is num || value is List<String>) d[key] = value;
      else if (value is DateTime) d[key] = df.format(value);
      else if (value == null) d[key] = null;
    });
    return d;
  }

  // Table representation of the model
  Map<String, String> get toTable;

  bool matchesKeyword(String keyword)
  {
    for (dynamic value in _data.values)
    {
      String v = null;
      if (value is String) v = value;
      else if (value is num) v = value.toString();
      else if (value is DateTime) v = df.format(value);

      if (v != null && v.toLowerCase().contains(keyword)) return true;
    }
    return false;
  }

  bool isEqual(ModelBase other)
  {
    for (String key in _data.keys)
    {
      if (!other._data.containsKey(key)) return false;

      // Collections with identical child elements are not considered equal in dart
      else if (_data[key] is List && other._data[key] is List)
      {
        if (!const DeepCollectionEquality.unordered().equals(_data[key], other._data[key])) return false;
      }
      else if (_data[key] is Map && other._data[key] is Map)
      {
        if (!const DeepCollectionEquality.unordered().equals(_data[key], other._data[key])) return false;
      }
      else if (_data[key] is Set && other._data[key] is Set)
      {
        if (!const DeepCollectionEquality.unordered().equals(_data[key], other._data[key])) return false;
      }
      else if (_data[key] != other._data[key]) return false;
    }

    return true;
  }

  dynamic deepCopy(dynamic data)
  {
    dynamic ret;
    if (data is List)
    {
      ret = new List();
      for (dynamic v in data)
      {
        ret.add(deepCopy(v));
      }
    }
    else if (data is Map)
    {
      ret = new Map();
      for (dynamic key in data.keys)
      {
        ret[key] = deepCopy(data[key]);
      }
    }
    else if (data is Set)
    {
      ret = new Set();
      for (dynamic v in data)
      {
        ret.add(deepCopy(v));
      }
    }
    else ret = data;
    return ret;
  }

  Map<String, dynamic> get data => _data;
  DateTime get created => _data["created"];
  void set created(DateTime value) { _data["created"] = value; }

  Map<String, dynamic> _data;
  static final DateFormat df = new DateFormat('y-MM-d H:mm:s');
}
