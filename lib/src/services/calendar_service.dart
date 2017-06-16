import 'dart:async';
import 'package:angular2/core.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:bokain_models/bokain_models.dart' show Day;

@Injectable()
class CalendarService
{
  CalendarService()
  {
    firebase.database().ref('days').orderByChild('start_time').equalTo("2017-06-16 08:00:00").once('value').then((firebase.QueryEvent qe) => _onChildAdded(qe));
   //_refDays.onChildAdded.listen(_onChildAdded);
    //_refDays = firebase.database().ref('days');
    //_refDays.onChildAdded.listen(_onChildAdded);
    //_refDays.onChildChanged.listen(_onChildChanged);
    //_refDays.onChildRemoved.listen(_onChildRemoved);
  }

  Day getDay(String salon_id, DateTime date)
  {
    //Day d = new Day(null, salon_id, date);
    //firebase.database().ref('days').push(d.encoded);
   // firebase.database().ref('days').orderByChild("")

    if (salon_id == null || date == null) return null;
    String id = _dayMap.keys.firstWhere((key) => _dayMap[key].salonId == salon_id && _dayMap[key].isSameDateAs(date), orElse: () => null);
    return (id == null) ? null : _dayMap[id];
  }

  Future<String> save(Day day) async
  {
    _loading = true;
    if (getDay(day.salonId, day.startTime) == null) await _refDays.push(day.encoded);
    else await _refDays.child(day.id).update(day.encoded);
    _loading = false;
    return null;
  }


  void _onChildAdded(firebase.QueryEvent e)
  {

    print(e.snapshot.val());
  //  _dayMap[e.snapshot.key] = new Day.decode(e.snapshot.key, e.snapshot.val());
  }
/*
  void _onChildChanged(firebase.QueryEvent e)
  {
    _dayMap[e.snapshot.key] = new Day.decode(e.snapshot.key, e.snapshot.val());
  }

  void _onChildRemoved(firebase.QueryEvent e)
  {
    _dayMap.remove(e.snapshot.key);
  }
*/
  bool get isLoading => _loading;

  Map<String, Day> _dayMap = new Map();
  firebase.DatabaseReference _refDays;

  bool _loading = false;

  Day currentDay;
  List<Day> currentWeek = new List(7);
  List<Day> currentMonth = new List();
}