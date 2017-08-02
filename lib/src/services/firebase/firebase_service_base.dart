library model_service;

import 'dart:async';
import 'dart:html' as dom show HttpRequest;
import 'dart:convert' show JSON;
import 'package:angular2/core.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:bokain_models/bokain_models.dart';
import 'package:bokain_models/src/services/firebase/calendar_service.dart';

part 'booking_service.dart';
part 'country_service.dart';
part 'customer_service.dart';
part 'journal_service.dart';
part 'language_service.dart';
part 'salon_service.dart';
part 'service_service.dart';
part 'service_addon_service.dart';
part 'skin_type_service.dart';
part 'user_service.dart';

abstract class FirebaseServiceBase
{
  FirebaseServiceBase(this._name)
  {
    _db = firebase.database();
    _ref = _db.ref(_name);

    _ref.onChildAdded.listen(_onChildAdded);
    _ref.onChildChanged.listen(_onChildChanged);
    _ref.onChildRemoved.listen(_onChildRemoved);
  }

  List<String> getIdsByProperty(String property, dynamic value)
  {
    if (value is String)
    {
      return _models.keys.where((id) =>
      _models[id].data[property] != null && (_models[id].data[property] as String).toLowerCase().compareTo(value.toLowerCase()) == 0).toList();
    }
    else
    {
      return _models.keys.where((id) => _models[id].data[property] != null && _models[id].data[property] == value).toList();
    }
  }

  Future<String> push(ModelBase model) async
  {
    _loading = true;
    model.created = new DateTime.now();
    model.addedBy = firebase.auth().currentUser.uid;

    firebase.ThenableReference ref = await _ref.push(model.encoded);
    _loading = false;

    return ref.key;
  }

  Future set(String id, ModelBase model) async
  {
    _loading = true;
    await _ref.child('$id').set(model.encoded);
    _loading = false;
  }

  Future remove(String id) async
  {
    try
    {
      _loading = true;
      await _ref.child('$id').remove();
      _loading = false;
    }
    on RangeError catch (e, s)
    {
      print(e);
      print(s);
    }
  }

  List<ModelBase> getModelsAsList([List<String> ids = null, bool include_disabled = false])
  {
    if (_models.isEmpty) return _models.values.toList(growable: false);

    List<ModelBase> output = (ids == null) ? new List.from(_models.values) : _models.values.where((m) => ids.contains(m.id)).toList(growable: !include_disabled);
    if (include_disabled == false)
    {
      output.removeWhere((model) => model.data.containsKey("status") && model.data["status"] != "active");
    }
    return output;
  }

  Map<String, ModelBase> getModelsAsMap([List<String> ids = null, bool include_disabled = false])
  {
    if (_models.isEmpty) return _models;

    Map<String, ModelBase> output;
    if (ids == null) output = new Map.from(_models);
    else
    {
      output = new Map();
      _models.keys.where(ids.contains).forEach((key) => output[key] = _models[key]);
    }

    if (include_disabled == false)
    {
      Iterable<String> disabledKeys = output.keys.where((k) => output[k].data.containsKey("status") && output[k].data["status"] != "active");
      disabledKeys.forEach(output.remove);
    }
    return output;
  }

  bool get loading => _loading;

  ModelBase getModel(String id) => _models.containsKey(id) ? _models[id] : null;

  List<String> get modelIds => _models.keys.toList(growable: false);

  void _onChildAdded(firebase.QueryEvent e)
  {
    ModelBase model = createModelInstance(e.snapshot.key, e.snapshot.val());
    _models[e.snapshot.key] = model;
    _onChildAddedController.add(model);
  }

  void _onChildChanged(firebase.QueryEvent e)
  {
    ModelBase model = createModelInstance(e.snapshot.key, e.snapshot.val());
    _models[e.snapshot.key] = model;
    _onChildUpdatedController.add(model);
  }

  void _onChildRemoved(firebase.QueryEvent e)
  {
    _models.remove(e.snapshot.key);
    _onChildRemovedController.add(e.snapshot.key);
  }

  ModelBase createModelInstance(String id, Map<String, dynamic> data);

  Stream<ModelBase> get childAddedStream => _onChildAddedController.stream;
  Stream<ModelBase> get childUpdatedStream => _onChildUpdatedController.stream;
  Stream<String> get childRemovedStream => _onChildRemovedController.stream;

  final String _name;
  firebase.Database _db;
  firebase.DatabaseReference _ref;
  bool _loading = false;

  Map<String, ModelBase> _models = new Map();
  final StreamController<ModelBase> _onChildAddedController = new StreamController();
  final StreamController<ModelBase> _onChildUpdatedController = new StreamController();
  final StreamController<String> _onChildRemovedController = new StreamController();
}