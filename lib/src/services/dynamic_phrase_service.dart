import 'dart:async';
import 'package:angular/di.dart';
import 'package:firebase/firebase.dart' as fb;

@Injectable()
class DynamicPhraseService
{
  DynamicPhraseService();

  void streamLanguage(String language_iso_639_1)
  {
    if (_childAddedListener != null) _childAddedListener.cancel();
    if (_childChangedListener != null) _childChangedListener.cancel();

    _streamedData = new Map();

    _q = fb.database().ref("phrases").orderByKey().equalTo(language_iso_639_1);

    _childAddedListener = _q.onChildAdded.listen((fb.QueryEvent qe)
    {
      _streamedData = qe.snapshot.val();
    });

    _childChangedListener = _q.onChildChanged.listen((fb.QueryEvent qe)
    {
      _streamedData = qe.snapshot.val();
    });
  }

  /**
   * Return phrases from the stream buffer
   */
  Map<String, String> getPhrases(String category, String key) => _streamedData.containsKey(category) && _streamedData[category].containsKey(key) ? _streamedData[category][key] : null;

  /**
   * Fetch phrases from the server
   */
  Future<Map<String, String>> fetchPhrases(String language_iso_639_1, String category, String id) async
  {
    fb.QueryEvent qe;
    try
    {
      qe = await fb.database().ref("phrases").child(language_iso_639_1).child(category).child(id).once("value");
    }
    catch (e)
    {
      print(e);
    }

    return qe == null ? null : qe.snapshot.val();
  }

  Future setPhrases(String language_iso_639_1, String category, String id, Map<String, String> value) async
  {
    await fb.database().ref("phrases").child(language_iso_639_1).child(category).child(id).set(value);
  }

  /**
   * {
   *    "products":
   *    {
   *      "kZqwsdafsdf":
   *      {
   *        "name":"Balancing Cleanser",
   *        "description_short":"A powerful cleanser...",
   *        ...
 *        },
   *      "xyz":
   *      {
   *      }
   *    }
   * }
   */
  Map<String, Map<String, Map<String, String>>> _streamedData = new Map();

  Map<String, Map<String, Map<String, String>>> get streamedData => _streamedData;

  fb.Query _q;
  StreamSubscription<fb.QueryEvent> _childAddedListener;
  StreamSubscription<fb.QueryEvent> _childChangedListener;
}