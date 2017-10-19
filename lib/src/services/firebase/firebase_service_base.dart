library firebase_service;

import 'dart:async';
import 'dart:html' as dom show HttpRequest;
import 'dart:convert' show JSON;
import 'dart:math' show Random;
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:bokain_models/bokain_models.dart';

part 'booking_service.dart';
part 'consultation_service.dart';
part 'country_service.dart';
part 'customer_service.dart';
part 'day_service.dart';
part 'ingredient_service.dart';
part 'journal_service.dart';
part 'language_service.dart';
part 'product_service.dart';
part 'product_category_service.dart';
part 'product_routine_service.dart';
part 'salon_service.dart';
part 'service_service.dart';
part 'service_addon_service.dart';
part 'skin_type_service.dart';
part 'user_service.dart';

abstract class FirebaseServiceBase<T>
{
  FirebaseServiceBase(this._name, [this._uniqueFields = const []])
  {
    _db = firebase.database();
  }

  void cancelStreaming()
  {
    if (_q != null)
    {
      print("CANCELLING STREAM $_name");
      _onStreamChildAddedListener.cancel();
      _onStreamChildChangedListener.cancel();
      _onStreamChildRemovedListener.cancel();
      _q = null;
    }
  }

  /**
   * Stream models asynchronously from remote server.
   * Use the onChildAdded/Changed/Removed stream outputs to detect changes
   */
  Stream<T> streamAll([FirebaseQueryParams queryParams = const FirebaseQueryParams()])
  {
    if (streaming) throw new StateError("this instance of $_name-service is already streaming data");

    print("STREAMING $_name (queryParams: $queryParams)");

    _q = _buildQuery(queryParams);
    _onStreamChildAddedListener = _q.onChildAdded.listen((qe) => _onChildAdded(qe.snapshot.key, qe.snapshot.val()));
    _onStreamChildChangedListener = _q.onChildChanged.listen((qe) => _onChildChanged(qe.snapshot.key, qe.snapshot.val()));
    _onStreamChildRemovedListener = _q.onChildRemoved.listen((qe) => _onChildRemoved(qe.snapshot.key));

    return _onChildAddedController.stream;
  }

  /**
   * Stream a single model asynchronously from remote server
   * * Use the onChildAdded stream outputs to detect changes
   */
  Stream<T> stream(String id)
  {
    if (streaming) throw new StateError("this instance of $_name-service is already streaming data");
    print("STREAMING $_name/$id");

    _q = _db.ref(_name).child(id);

    _onStreamChildAddedListener = _q.onValue.listen((qe) => _onChildAdded(qe.snapshot.key, qe.snapshot.val()));
    return _onChildAddedController.stream;
  }

  /**
   * [force]: skip buffer and force server-fetch
   */
  Future<T> fetch(String id, {bool force: false, bool cache: true}) async
  {
    if (id == null) return null;
    if (!force && get(id) != null) return get(id);

    _loading = true;
    firebase.QueryEvent qe = await _db.ref(_name).child(id).once("value");
    _loading = false;
    if (!qe.snapshot.exists()) throw new Exception("model with id $id of type $_name not found");

    if (cache)
    {
      if (_cachedModels.containsKey(id)) return _onChildChanged(id, qe.snapshot.val());
      else return _onChildAdded(id, qe.snapshot.val());
    }
    else return createModelInstance(id, qe.snapshot.val());
  }

  /**
   * Fetch models with specified ids asynchronously from the server.
   * Clears model cache and cancels streaming.
   */
  Future<Map<String, T>> fetchMany(List<String> ids) async
  {
    _loading = true;
    cancelStreaming();
    _cachedModels.clear();
    print("FETCHING MANY $_name (ids: $ids)");

    for (String id in ids)
    {
      firebase.QueryEvent qe = await _db.ref(_name).orderByKey().equalTo(id).once("value");
      if (qe.snapshot.exists())
      {
        Map<String, Map<String, dynamic>> data = qe.snapshot.val();
        data.forEach((String key, Map<String, dynamic> data)
        {
          if (_cachedModels.containsKey(key)) _onChildChanged(key, data);
          else
            _onChildAdded(key, data);
        });
      }
    }
    _loading = false;
    return _cachedModels;
  }

  /**
   * Fetch models asynchronously from the server.
   * Clears model cache and cancels streaming.
   */
  Future<Map<String, T>> fetchAll([FirebaseQueryParams queryParams = const FirebaseQueryParams(), bool cache = true]) async
  {
    _loading = true;
    print("FETCHING ALL $_name (cache: $cache, queryParams: $queryParams)");

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

    if (cache)
    {
      cancelStreaming();
      _cachedModels.clear();
      if (data != null) for (String id in data.keys)
        _onChildAdded(id, data[id]);
      _loading = false;
      return _cachedModels;
    }
    else
    {
      Map<String, T> output = new Map();
      if (data != null) for (String id in data.keys)
        output[id] = createModelInstance(id, data[id]);
      _loading = false;
      return output;
    }
  }

  Future<T> fetchByProperty(String property, dynamic value, {bool force: false, bool cache: true}) async
  {
    if (!force)
    {
      T model = getByProperty(property, value);
      if (model != null) return model;
    }

    firebase.QueryEvent qe = await _db.ref(_name).orderByChild(property).equalTo(value).limitToFirst(1).once("value");
    if (!qe.snapshot.exists()) throw new Exception("model of type $_name with property $property:$value not found");

    String id = qe.snapshot.val().keys.first;
    Map<String, dynamic> data = qe.snapshot.val().values.first;

    if (cache)
    {
      if (_cachedModels.containsKey(id)) return _onChildChanged(id, data);
      else return _onChildAdded(id, data);
    }
    else return createModelInstance(id, data);
  }

  T get(String id)
  {
    if (id == null) return null;
    return _cachedModels.containsKey(id) ? _cachedModels[id] : null;
  }

  Map<String, T> getMany(List<String> ids)
  {
    if (ids == null) return _cachedModels;
    else
    {
      Map<String, T> output = new Map();
      _cachedModels.keys.where(ids.contains).forEach((key) => output[key] = _cachedModels[key]);
      return output;
    }
  }

  T getByProperty(String property, dynamic value)
  {
    return _cachedModels.values.firstWhere((m)
    => (m as ModelBase).data.containsKey(property) && (m as ModelBase).data[property] == value, orElse: ()
    => null);
  }

  Iterable<T> getAllByPropertyAsList(String property, dynamic value)
  {
    return _cachedModels.values.where((m)
    => (m as ModelBase).data.containsKey(property) && (m as ModelBase).data[property] == value);
  }

  /**
   * Push a new model onto remote
   */
  Future<String> push(T t) async
  {
    String key;
    try
    {
      _loading = true;

      ModelBase model = t as ModelBase;

      model.created = new DateTime.now();
      model.addedBy = firebase.auth().currentUser.uid;

      await _validateUniqueFields(t);

      Map<String, dynamic> data = model.encoded;

      firebase.DatabaseReference ref = await _db.ref(_name).push(data).future;

      await _updateUniqueFields(t, ref.key, null);

      if (!streaming) _onChildAdded(ref.key, data);

      key = ref.key;
    }
    catch (e, s)
    {
      print(e);
      print(s);
      throw new Exception(e);
    }
    finally
    {
      _loading = false;
      return key;
    }
  }

  /**
   * Update the remote model
   */
  Future<T> set(T t) async
  {
    ModelBase model = t as ModelBase;

    if (model.id == null) return null;
    try
    {
      _loading = true;
      await _validateUniqueFields(t);
      T oldModel = await fetch(model.id, force: true, cache: false);
      Map<String, dynamic> data = model.encoded;
      await _db.ref(_name).child(model.id).set(data);
      _updateUniqueFields(t, model.id, oldModel);
      if (!streaming) _onChildChanged(model.id, data);
    }
    catch (e, s)
    {
      print(s);
      throw new Exception(e);
    }
    finally
    {
      _loading = false;
    }
    return t;
  }

  /**
   * Patch a single model property
   */
  Future<T> patch(T t, String property) async
  {
    ModelBase model = t as ModelBase;

    if (model.id == null) return null;
    try
    {
      await _db.ref(_name).child(model.id).child(property).set(model.data[property]);
      if (!streaming) _onChildChanged(model.id, model.data);
    }
    catch (e, s)
    {
      print(s);
      throw new Exception(e);
    }
    finally
    {
      _loading = false;
    }

    return t;
  }

  /**
   * Remove the model from remote
   */
  Future<String> remove(String id) async
  {
    try
    {
      _loading = true;

      /**
       * Remove unique indices
       */
      T t = await fetch(id, force: true, cache: false);
      ModelBase model = t as ModelBase;
      for (UniqueField field in _uniqueFields)
      {
        await _db.ref(field.indexTableName).child(model.data[field.propertyName]).remove();
      }

      /**
       * Remove model
       */
      await _db.ref(_name).child(id).remove();
    }
    on RangeError catch (e, s)
    {
      print(e);
      print(s);
    }
    finally
    {
      _loading = false;
    }
    return id;
  }

  bool get streaming => _q != null;

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
      else
        return _db.ref(_name).orderByKey().limitToLast(queryParams.limitTo);
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
    else
      throw new StateError("Invalid QueryParams");
  }

  Future _validateUniqueFields(T t) async
  {
    ModelBase model = t as ModelBase;

    for (UniqueField field in _uniqueFields)
    {
      dynamic value = _sanitizeKey(model.data[field.propertyName].toString());

      /// If property is not required and value is empty, skip validation
      if (!field.required && value == "null") continue;

      /// Check if the value already exists, and doesn't belong to the current model
      firebase.QueryEvent event = await _db.ref(field.indexTableName).child(value).once('value');
      if (event.snapshot.exists() && (event.snapshot.val() != model.id))
      {
        throw new StateError("An object of type $_name with unique property ${field.propertyName}: ${model.data[field.propertyName]} already exists.");
      }
    }
  }

  Future _updateUniqueFields(T t, String id, T old_t) async
  {
    ModelBase model = t as ModelBase;
    ModelBase oldModel = old_t as ModelBase;

    for (UniqueField field in _uniqueFields)
    {
      String value = _sanitizeKey(model.data[field.propertyName].toString());
      if (!field.required && value == "null") continue;

      if (oldModel == null)
      {
        if (!field.required && value == null) continue;
        await _db.ref(field.indexTableName).child(value).set(id);
      }
      else
      {
        /// Remove old index (if property has changed)
        dynamic oldValue = _sanitizeKey(oldModel.data[field.propertyName]);
        if (oldValue != value)
        {
          await _db.ref(field.indexTableName).child(oldValue).remove();
          await _db.ref(field.indexTableName).child(value).set(id);
        }
      }
    }
  }
  
  String _sanitizeKey(String value)
  {
    return (value).replaceAll(".", "%2E").replaceAll("\$", "%24").replaceAll("#", "%23").replaceAll("[", "%5B").replaceAll("]", "%5D").replaceAll("/", "2F");
  }

  T _onChildAdded(String key, Map<String, dynamic> data)
  {
    T t = createModelInstance(key, data);
    ModelBase model = t as ModelBase;

    _cachedModels[model.id] = t;
    _onChildAddedController.add(t);

    return t;
  }

  T _onChildChanged(String key, Map<String, dynamic> data)
  {
    T t = createModelInstance(key, data);
    ModelBase model = t as ModelBase;
    _cachedModels[model.id] = t;

    _onChildChangedController.add(t);
    return t;
  }

  String _onChildRemoved(String key)
  {
    _cachedModels.remove(key);
    _onChildRemovedController.add(key);
    return key;
  }

  T createModelInstance(String id, Map<String, dynamic> data);

  bool get loading => _loading;

  Stream<T> get onChildAdded => _onChildAddedController.stream;

  Stream<T> get onChildUpdated => _onChildChangedController.stream;

  Stream<String> get onChildRemoved => _onChildRemovedController.stream;

  Map<String, T> get cachedModels => _cachedModels;

  StreamSubscription<firebase.QueryEvent> _onStreamChildAddedListener;
  StreamSubscription<firebase.QueryEvent> _onStreamChildChangedListener;
  StreamSubscription<firebase.QueryEvent> _onStreamChildRemovedListener;

  final String _name;
  final Map<String, T> _cachedModels = new Map();
  final StreamController<T> _onChildAddedController = new StreamController.broadcast();
  final StreamController<T> _onChildChangedController = new StreamController.broadcast();
  final StreamController<String> _onChildRemovedController = new StreamController.broadcast();

  firebase.Database _db;
  firebase.Query _q;
  bool _loading = false;

  final List<UniqueField> _uniqueFields;
}

class UniqueField
{
  UniqueField(this.indexTableName, this.propertyName, this.required);

  final String indexTableName;
  final String propertyName;
  final bool required;
}