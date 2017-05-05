library model_base;
import 'dart:math';
import 'dart:convert';
import 'phrase.dart';
part 'editable_model/editable_model.dart';
part 'editable_model/customer.dart';
part 'editable_model/room.dart';
part 'editable_model/salon.dart';
part 'editable_model/service.dart';
part 'editable_model/service_addon.dart';
part 'editable_model/user.dart';
part 'calendar/booking.dart';
part 'calendar/day.dart';
part 'calendar/increment.dart';

abstract class ModelBase
{
  ModelBase([this._id = null])
  {
    _data = new Map();
    created = new DateTime.now();
  }

  ModelBase.from(ModelBase other) : this._id = other.id
  {
    _data = _deepCopy(other._data);
    if (!_data.containsKey("created")) _data["created"] = new DateTime.now();
  }

  ModelBase.decode(this._id, Map<String, dynamic> d)
  {
    _data = new Map();
    created = DateTime.parse(d["created"]);
  }

  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> d = new Map();

    /// Auto-encode default type properties (String, DateTime, num, null)
    _data.forEach((key, value)
    {
      if (value is String || value is bool || value is int || value is double || value is List<String> || value == null) d[key] = value;
      else if (value is DateTime) d[key] = timestampFormat(value);
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
      else if (value is DateTime) v = timestampFormat(value);

      if (v != null && v.toLowerCase().contains(keyword)) return true;
    }
    return false;
  }

  bool isEqual(ModelBase other)
  {

    return JSON.encode(encoded) == JSON.encode(other.encoded);
/*
    for (String key in _data.keys)
    {
      if (!other._data.containsKey(key)) return false;

      /*
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
      */
      if ((_data[key] is String || data[key] is num) && _data[key] != other._data[key]) return false;
    }

    return true;
    */
  }

  dynamic _deepCopy(dynamic data)
  {
    dynamic ret;
    if (data is List)
    {
      ret = new List();
      for (dynamic v in data)
      {
        ret.add(_deepCopy(v));
      }
    }
    else if (data is Map)
    {
      ret = new Map();
      for (dynamic key in data.keys)
      {
        ret[key] = _deepCopy(data[key]);
      }
    }
    else if (data is Set)
    {
      ret = new Set();
      for (dynamic v in data)
      {
        ret.add(_deepCopy(v));
      }
    }
    else ret = data;
    return ret;
  }

  String get id => _id;
  Map<String, dynamic> get data => _data;
  DateTime get created => _data["created"];
  void set created(DateTime value) { _data["created"] = value; }

  Map<String, dynamic> _data;
  final String _id;

  static String timestampFormat(DateTime dt)
  {
    String y = dt.year.toString();
    String MM = dt.month < 10 ? "0" + dt.month.toString() : dt.month.toString();
    String dd = dt.day < 10 ? "0" + dt.day.toString() : dt.day.toString();
    String HH = dt.hour < 10 ? "0" + dt.hour.toString() : dt.hour.toString();
    String mm = dt.minute < 10 ? "0" + dt.minute.toString() : dt.minute.toString();
    String ss = dt.second < 10 ? "0" + dt.second.toString() : dt.second.toString();
    return "$y-$MM-$dd $HH:$mm:$ss";
  }

  static final Phrase phrase = new Phrase();
}
