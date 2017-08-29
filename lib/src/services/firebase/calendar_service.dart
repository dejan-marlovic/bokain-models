import 'dart:async';

import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:bokain_models/bokain_models.dart' show ModelBase;
import 'package:bokain_models/bokain_models.dart' show Day;

@Injectable()
class CalendarService
{
  CalendarService()
  {
    onDayAdded = _onDayAddedController.stream;
    onDayChanged = _onDayChangedController.stream;
  }

  void setFilters(DateTime from, DateTime to)
  {
    _loading = true;
    from = new DateTime(from.year, from.month, from.day, Day.startHour, Day.startMinute);
    to = new DateTime(to.year, to.month, to.day, Day.endHour, Day.endMinute);

    firebase.Query q = firebase.database().ref('days').orderByChild('start_time').startAt(ModelBase.timestampFormat(from)).endAt(ModelBase.timestampFormat(to));

    addStreamListener?.cancel();
    changeStreamListener?.cancel();
    removeStreamListener?.cancel();
    addStreamListener = q.onChildAdded.listen(_onChildAdded);
    changeStreamListener = q.onChildChanged.listen(_onChildChanged);
    removeStreamListener = q.onChildRemoved.listen(_onChildRemoved);

    _finishedLoadingTimer?.cancel();
    _finishedLoadingTimer = new Timer(new Duration(milliseconds: 1000 * (from.difference(to).inDays + 1)), () => _loading = false);
  }

  Future<Day> fetchDay(String id) async
  {
    _loading = true;
    firebase.QueryEvent qe = await firebase.database().ref('days').child(id).once('value');
    _loading = false;
    return qe.snapshot.exists() ? new Day.decode(qe.snapshot.key, qe.snapshot.val()) : null;
  }

  /**
   * [date_formatted] must be formatted "YYYY-MM-DD HH:MM:SS"
   */
  Future<Day> fetchDayByDate(String date_formatted) async
  {
    _loading = true;
    firebase.QueryEvent qe = await firebase.database().ref('days').orderByChild('start_time').equalTo(date_formatted).limitToFirst(1).once('value');
    _loading = false;

    return qe.snapshot.exists() ? new Day.decode(qe.snapshot.key, qe.snapshot.val()) : null;
  }

  Future save(Day day) async
  {
    _loading = true;
    if (day.id == null) await firebase.database().ref('days').push(day.encoded);
    else await firebase.database().ref('days').child(day.id).update(day.encoded);
    _loading = false;
  }

  void _onChildAdded(firebase.QueryEvent qe)
  {
    Day d = new Day.decode(qe.snapshot.key, qe.snapshot.val());
    _onDayAddedController.add(d);
    _finishedLoadingTimer?.cancel();
    _loading = false;
  }

  void _onChildRemoved(firebase.QueryEvent qe)
  {
   // _models.remove(qe.snapshot.key);
  }

  void _onChildChanged(firebase.QueryEvent qe)
  {
    Day d = new Day.decode(qe.snapshot.key, qe.snapshot.val());
    _onDayChangedController.add(d);
  }

  bool get loading => _loading;


  bool _loading = false;

  StreamSubscription<firebase.QueryEvent> addStreamListener;
  StreamSubscription<firebase.QueryEvent> changeStreamListener;
  StreamSubscription<firebase.QueryEvent> removeStreamListener;

  final StreamController<Day> _onDayAddedController = new StreamController<Day>.broadcast();
  final StreamController<Day> _onDayChangedController = new StreamController<Day>.broadcast();

  Timer _finishedLoadingTimer;

  Stream<Day> onDayAdded;
  Stream<Day> onDayChanged;

}
