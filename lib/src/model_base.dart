library model_base;
import 'dart:math';
import 'dart:convert';
import 'package:fo_components/fo_components.dart' show FoModel;
import 'package:intl/intl.dart' show DateFormat;
import 'package:serializable/serializable.dart';
import 'static_model/skin_type.dart';

part 'editable_model/consultation.dart';
part 'editable_model/customer.dart';
part 'editable_model/ingredient.dart';
part 'editable_model/product.dart';
part 'editable_model/product_category.dart';
part 'editable_model/product_routine.dart';
part 'editable_model/room.dart';
part 'editable_model/salon.dart';
part 'editable_model/service.dart';
part 'editable_model/service_addon.dart';
part 'editable_model/settings.dart';
part 'editable_model/user.dart';
part 'editable_model/webshop_content.dart';
part 'calendar/booking.dart';
part 'calendar/day.dart';
part 'calendar/increment.dart';
part 'journal_entry.dart';
part 'simple_model.dart';

part 'model_base.g.dart';

/*
class ModelBase implements FoModel
{
  ModelBase(this.added_by)
  {
    //data = new Map();
    created = new DateTime.now();
  }

  DateTime created;
  final String added_by;
}*/

  /*
  ModelBase.from(ModelBase other) : super(other.id)
  {
    data = _deepCopy(other.data);
    if (!data.containsKey("created")) data["created"] = new DateTime.now();
  }

  ModelBase.decode(String id, Map<String, dynamic> d) : super(id)
  {
    data = new Map();
    created = (d.containsKey("created")) ? DateTime.parse(d["created"]) : new DateTime.now();
    addedBy = d["added_by"];
    d.remove("created");
    d.remove("added_by");
  }

  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> d = new Map();

    /// Auto-encode default type properties (String, num, bool, null and DateTime)
    data.forEach((key, value)
    {
      if (value is String || value is num || value is bool || value == null) d[key] = value;
      else if (value is DateTime) d[key] = timestampFormat(value);
      else if (value is List) d[key] = new List.from(value);
    });
    return d;
  }

  List<String> get tableColumns => super.tableColumns..addAll(["created", "added_by"]);

  bool matchesKeyword(String keyword)
  {
    for (dynamic value in data.values)
    {
      String v = null;
      if (value is String) v = value;
      else if (value is num) v = value.toString();
      else if (value is DateTime) v = timestamp.format(value);

      if (v != null && v.toLowerCase().contains(keyword)) return true;
    }
    return false;
  }

  bool isEqual(ModelBase other) => JSON.encode(encoded) == JSON.encode(other.encoded);

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


  String get addedBy => data["added_by"];
  DateTime get created => data["created"];
  void set created(DateTime value) { data["created"] = value; }
  void set addedBy(String value) { data["added_by"] = value; }

}

String timestampFormat(DateTime dt)
{
  String y = dt.year.toString();
  String MM = dt.month < 10 ? "0" + dt.month.toString() : dt.month.toString();
  String dd = dt.day < 10 ? "0" + dt.day.toString() : dt.day.toString();
  String HH = dt.hour < 10 ? "0" + dt.hour.toString() : dt.hour.toString();
  String mm = dt.minute < 10 ? "0" + dt.minute.toString() : dt.minute.toString();
  String ss = dt.second < 10 ? "0" + dt.second.toString() : dt.second.toString();
  return "$y-$MM-$dd $HH:$mm:$ss";
}
  */

final DateFormat timestamp = new DateFormat('y-MM-dd HH:mm:ss');