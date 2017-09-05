library firebase_service;

import 'dart:async';
import 'dart:html' as dom show HttpRequest;
import 'dart:convert' show JSON;
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:random_string/random_string.dart' as rs;
import 'package:bokain_models/bokain_models.dart';

part 'booking_service.dart';
part 'country_service.dart';
part 'customer_service.dart';
part 'day_service.dart';
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
  }

  void cancelStreaming()
  {
    if (_q != null)
    {
      _onChildAddedListener.cancel();
      _onChildChangedListener.cancel();
      _onChildRemovedListener.cancel();
      _streamedModels.clear();
    }
  }

  /**
   * Stream models asynchronously from remote server.
   * Use the onChildAdded/Updated/Removed stream outputs to detect changes
   */
  Stream<ModelBase> streamAll([FirebaseQueryParams queryParams = const FirebaseQueryParams()])
  {
    //if (_q != null) throw new StateError("this instance of $_name-service is already streaming data");
    cancelStreaming();

    print("STREAMING $_name");

    _q = _buildQuery(queryParams);
    _onChildAddedListener = _q.onChildAdded.listen(_onChildAdded);
    _onChildChangedListener = _q.onChildChanged.listen(_onChildChanged);
    _onChildRemovedListener = _q.onChildRemoved.listen(_onChildRemoved);

    return _onChildAddedController.stream;
  }

  /**
   * Fetch models asynchronously from remote server.
   */
  Future<Map<String, ModelBase>> fetchAll([FirebaseQueryParams queryParams = const FirebaseQueryParams()]) async
  {
    firebase.QueryEvent queryEvent = await _buildQuery(queryParams).once('value');

    dynamic val = queryEvent.snapshot.val();

    Map<String, Map<String, dynamic>> data;
    if (val is Map) data = queryEvent.snapshot.val();
    else if (val is List)
    {
      data = new Map();
      for (int i = 0; i < val.length; i++)
      {
        Map<String, dynamic> row = val[i];
        if (row != null) data[i.toString()] = row;
      }
    }

    _cachedModels.clear();

    if (data != null)
    {
      for (String id in data.keys)
      {
        _cachedModels[id] = createModelInstance(id, data[id]);
      }
    }

    return _cachedModels;
  }

  firebase.Query _buildQuery(FirebaseQueryParams queryParams)
  {
    if (queryParams == null) throw new ArgumentError("QueryParams cannot be null");

    if (queryParams.searchProperty == null || queryParams.searchValue == null)
    {
      if (queryParams.limitTo == null || queryParams.limitDirection == null)
      {
        return _db.ref(_name).orderByKey();
      }
      else if (queryParams.limitDirection == QUERY_LIMIT_DIRECTION.ASC)
      {
        return _db.ref(_name).orderByKey().limitToFirst(queryParams.limitTo);
      }
      else return _db.ref(_name).orderByKey().limitToLast(queryParams.limitTo);
    }
    // Search key/value are set
    else if (queryParams.searchProperty != null && queryParams.searchValue != null)
    {
      if (queryParams.limitTo == null || queryParams.limitDirection == null)
      {
        return _db.ref(_name)
            .orderByChild(queryParams.searchProperty)
            .equalTo(queryParams.searchValue);
      }
      else if (queryParams.limitDirection == QUERY_LIMIT_DIRECTION.ASC)
      {
        return _db.ref(_name)
            .orderByChild(queryParams.searchProperty)
            .equalTo(queryParams.searchValue)
            .limitToFirst(queryParams.limitTo);
      }
      else
      {
        return _db.ref(_name)
            .orderByChild(queryParams.searchProperty)
            .equalTo(queryParams.searchValue)
            .limitToLast(queryParams.limitTo);
      }
    }
    else if (queryParams.searchProperty != null && queryParams.searchRangeStart != null && queryParams.searchRangeEnd != null)
    {
      if (queryParams.limitTo == null || queryParams.limitDirection == null)
      {
        return _db.ref(_name)
            .orderByChild(queryParams.searchProperty)
            .startAt(queryParams.searchRangeStart)
            .endAt(queryParams.searchRangeEnd);
      }
      else if (queryParams.limitDirection == QUERY_LIMIT_DIRECTION.ASC)
      {
        return _db.ref(_name)
            .orderByChild(queryParams.searchProperty)
            .startAt(queryParams.searchRangeStart)
            .endAt(queryParams.searchRangeEnd)
            .limitToFirst(queryParams.limitTo);
      }
      else
      {
        return _db.ref(_name)
            .orderByChild(queryParams.searchProperty)
            .startAt(queryParams.searchRangeStart)
            .endAt(queryParams.searchRangeEnd)
            .limitToLast(queryParams.limitTo);
      }
    }
    else throw new StateError("Invalid QueryParams");
  }

  /**
   * Push a new model onto remote
   */
  Future<String> push(ModelBase model) async
  {
    _loading = true;
    model.created = new DateTime.now();
    model.addedBy = firebase.auth().currentUser.uid;
    firebase.ThenableReference ref = await _db.ref(_name).push(model.encoded);
    _loading = false;

    _cachedModels[ref.key] = model;

    return ref.key;
  }

  /**
   * Update the remote model
   */
  Future set(String id, ModelBase model) async
  {
    _loading = true;
    await _db.ref(_name).child('$id').set(model.encoded);
    _loading = false;
  }

  /**
   * Remove the model from remote
   */
  Future remove(String id) async
  {
    try
    {
      _loading = true;
      await _db.ref(_name).child('$id').remove();
      _loading = false;
    }
    on RangeError catch (e, s)
    {
      print(e);
      print(s);
    }
  }

  /**
   * [force]: skip buffer and force server-fetch
   */
  Future<ModelBase> fetch(String id, {bool force: false}) async
  {
    if (id == null) return null;

    if (!force && _cachedModels.containsKey(id) && _cachedModels[id] != null) return _cachedModels[id];

    _loading = true;
    firebase.QueryEvent qe = await _db.ref(_name).child(id).once("value");
    _loading = false;
    if (!qe.snapshot.exists()) throw new Exception("model with id $id of type $_name not found");

    ModelBase model = createModelInstance(qe.snapshot.key, qe.snapshot.val());
    _cachedModels[model.id] = model;

    return model;
  }

  Future<Map<String, ModelBase>> fetchMany(List<String> ids, {bool force: false}) async
  {
    if (!force)
    {
      Iterable<String> matches = ids.where(_cachedModels.containsKey);
      if (matches.length == ids.length)
      {
        Map<String, ModelBase> models = new Map();
        for (String key in matches)
        {
          models[key] = _cachedModels[key];
        }
        _cachedModels.clear();
        _cachedModels.addAll(models);
        print(_cachedModels);
        return _cachedModels;
      }
    }


    _cachedModels.clear();

    _loading = true;

    for (String id in ids)
    {
      firebase.QueryEvent qe = await _db.ref(_name).orderByKey().equalTo(id).once("value");
      if (qe.snapshot.exists())
      {
        Map<String, Map<String, dynamic>> data = qe.snapshot.val();
        data.forEach((String key, Map<String, dynamic> row)
        {
          _cachedModels[key] = createModelInstance(key, row);
        });
      }
    }
    _loading = false;
    return _cachedModels;
  }

  Future<ModelBase> fetchByProperty(String property, dynamic value) async
  {
    firebase.QueryEvent qe = await _db.ref(_name).orderByChild(property).equalTo(value).limitToFirst(1).once("value");

    ModelBase model;
    if (qe.snapshot.exists())
    {
      model = createModelInstance(qe.snapshot.key, qe.snapshot.val());
      _cachedModels[qe.snapshot.key] = model;
    }
    return model;
  }

  ModelBase get(String id)
  {
    if (id == null) return null;
    //if (_q == null) streamAll(); //print("This instance of $_name-service is not currently streaming data");
    return streamedModels.containsKey(id) ? streamedModels[id] : null;
  }

  Map<String, ModelBase> getMany(List<String> ids)
  {
    //if (_q == null) print("This instance of $_name-service is not currently streaming data");

    Map<String, ModelBase> output = new Map();
    if (ids != null) streamedModels.values.where((m) => ids.contains(m.id)).forEach((m) => output[m.id] = m);
    else output = streamedModels;
    return output;
  }

  ModelBase getByProperty(String property, dynamic value)
  {
    //if (_q == null) print("This instance of $_name-service is not currently streaming data");
    return streamedModels.values.firstWhere((m) => m.data.containsKey(property) && m.data[property] == value, orElse: () => null);
  }

  Iterable<ModelBase> getAllByProperty(String property, dynamic value)
  {
    if (_q == null) print("This instance of $_name-service is not currently streaming data");
    return _streamedModels.values.where((m) => m.data.containsKey(property) && m.data[property] == value);
  }

  bool get streaming => _q != null;

  Future<ModelBase> _onChildAdded(firebase.QueryEvent e) async
  {
    _loading = true;
    ModelBase model = createModelInstance(e.snapshot.key, e.snapshot.val());
    _streamedModels[model.id] = model;

    _onChildAddedController.add(model);
    new Timer(const Duration(milliseconds: 400), () => _loading = false);
    return model;
  }

  Future<ModelBase> _onChildChanged(firebase.QueryEvent e) async
  {
    ModelBase model = createModelInstance(e.snapshot.key, e.snapshot.val());
    _streamedModels[model.id] = model;
    _onChildChangedController.add(model);
    return model;
  }

  Future<String> _onChildRemoved(firebase.QueryEvent e) async
  {
    _streamedModels.remove(e.snapshot.key);
    _onChildRemovedController.add(e.snapshot.key);
    return e.snapshot.key;
  }

  ModelBase createModelInstance(String id, Map<String, dynamic> data);

  bool get loading => _loading;
  Stream<ModelBase> get onChildAdded => _onChildAddedController.stream;
  Stream<ModelBase> get onChildUpdated => _onChildChangedController.stream;
  Stream<String> get onChildRemoved => _onChildRemovedController.stream;
  Map<String, ModelBase> get streamedModels
  {
    if (!streaming) streamAll();
    //if (_q == null) throw new StateError("this instance of $_name-service is not currently streaming data");
    return _streamedModels;
  }
  Map<String, ModelBase> get cachedModels => _cachedModels;

  final String _name;
  final Map<String, ModelBase> _streamedModels = new Map();
  final Map<String, ModelBase> _cachedModels = new Map();

  StreamSubscription<firebase.QueryEvent> _onChildAddedListener;
  StreamSubscription<firebase.QueryEvent> _onChildChangedListener;
  StreamSubscription<firebase.QueryEvent> _onChildRemovedListener;

  final StreamController<ModelBase> _onChildAddedController = new StreamController.broadcast();
  final StreamController<ModelBase> _onChildChangedController = new StreamController.broadcast();
  final StreamController<String> _onChildRemovedController = new StreamController.broadcast();

  firebase.Database _db;
  firebase.Query _q;
  bool _loading = false;
}