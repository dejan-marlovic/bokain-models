part of model_base;

class Increment extends ModelBase
{
  static const Duration duration = const Duration(minutes: 10);

  Increment(DateTime start_time) : super()
  {
    startTime = start_time;
    endTime = startTime.add(duration);
  }

  Increment.from(Increment other)
  {
    startTime = other.startTime;
    endTime = other.endTime;
    state = other.state;
    bookingId = other.bookingId;
    availableRoomIds = new List.from(other.availableRoomIds);
  }

  @override
  Increment.decode(Map<String, String> d)
  {
    startTime = DateTime.parse(d["start_time"]);
    endTime = DateTime.parse(d["end_time"]);
    state = d["state"];
    bookingId = d["booking_id"];
  }

  @override
  Map<String, String> get encoded => super.encoded;

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(['date'])] = ModelBase.timestampFormat(startTime);
    table[ModelBase.phrase.get(['booking'])] = bookingId;
    return table;
  }

  void resetState()
  {
    state = null;
    bookingId = null;
    availableRoomIds = [];
  }

  /// This list is not stored in the database, as it depends on context (selected service and salon)
  List<String> availableRoomIds = new List();

  Map<String, dynamic> _data = new Map();
  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  String get state => _data["state"];
  String get bookingId => _data["booking_id"];

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set state(String value) { _data["state"] = value; }
  void set bookingId(String value) { _data["booking_id"] = value; }
}