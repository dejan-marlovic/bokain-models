import 'dart:async';
import 'package:angular2/core.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:bokain_models/bokain_models.dart' show ModelBase;
import 'package:bokain_models/bokain_models.dart' show Day;

@Injectable()
class CalendarService
{
  CalendarService()
  {
    _refDays = firebase.database().ref('days');
  }

  void setRange(DateTime from, DateTime to, String salon_id)
  {
    _dayMap.clear();

    from = new DateTime(from.year, from.month, from.day, Day.startHour, Day.startMinute);
    to = new DateTime(from.year, from.month, from.day, Day.endHour, Day.endMinute);

    DateTime iDate = new DateTime(from.year, from.month, from.day, from.hour, from.minute);
    while (iDate.isBefore(to))
    {
      _dayMap[iDate.toIso8601String() + salon_id] = new Day(null, salon_id, iDate);
      iDate = iDate.add(const Duration(days: 1));
    }

    firebase.Query q = _refDays.orderByChild('start_time').startAt(ModelBase.timestampFormat(from)).endAt(ModelBase.timestampFormat(to));

    addStream?.cancel();
    changeStream?.cancel();
    removeStream?.cancel();
    addStream = q.onChildAdded.listen(_onChildAdded);
    changeStream = q.onChildChanged.listen(_onChildChanged);
    removeStream = q.onChildRemoved.listen(_onChildRemoved);
  }

  Day getDay(String salon_id, DateTime date)
  {
    if (salon_id == null || date == null) return null;
    String id = _dayMap.keys.firstWhere((key) => _dayMap[key].salonId == salon_id && _dayMap[key].isSameDateAs(date), orElse: () => null);
    return (id == null) ? null : _dayMap[id];
  }

  Future<String> save(Day day) async
  {
    _loading = true;
    if (day.id == null) await _refDays.push(day.encoded);
    else await _refDays.child(day.id).update(day.encoded);
    _loading = false;
    return null;
  }


  void _onChildAdded(firebase.QueryEvent qe)
  {
    Day d = new Day.decode(qe.snapshot.key, qe.snapshot.val());
    _dayMap.remove(getDay(d.salonId, d.startTime));

    _dayMap[qe.snapshot.key] = d;
  }

  void _onChildRemoved(firebase.QueryEvent qe)
  {
    _dayMap.remove(qe.snapshot.key);
  }

  void _onChildChanged(firebase.QueryEvent qe)
  {
    _dayMap[qe.snapshot.key] = new Day.decode(qe.snapshot.key, qe.snapshot.val());
  }

  Map<String, Day> get dayMap => _dayMap;

  final Map<String, Day> _dayMap = new Map();

  bool get isLoading => _loading;

  firebase.DatabaseReference _refDays;
  bool _loading = false;

  StreamSubscription<firebase.QueryEvent> addStream;
  StreamSubscription<firebase.QueryEvent> changeStream;
  StreamSubscription<firebase.QueryEvent> removeStream;
}