part of model_base;

class Increment extends ModelBase
{
  static const Duration duration = const Duration(minutes: 10);

  Increment(DateTime start_time) : super()
  {
    startTime = start_time;
    endTime = startTime.add(duration);
    userStates = new Map<String, UserState>();
  }
  

  @override
  Increment.decode(Map<String, dynamic> d)
  {
    startTime = DateTime.parse(d["start_time"]);
    endTime = DateTime.parse(d["end_time"]);
    Map<String, Map<String, String>> userStateTable = d["user_states"];
    userStates = new Map<String, UserState>();
    if (userStateTable == null) userStates = new Map();
    else userStateTable.keys.forEach((id) => userStates[id] = new UserState.decode(userStateTable[id]));
  }

  @override
  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> output = super.encoded;
    output["user_states"] = new Map<String, Map<String, String>>();
    userStates.keys.forEach((id) => output["user_states"][id] = userStates[id].encoded);
    return output;
  }

  @override
  Map<String, String> get toTable
  {
    Map<String, String> table = new Map();
    table[ModelBase.phrase.get(['date'])] = ModelBase.timestampFormat(startTime);
    return table;
  }

  Map<String, dynamic> _data = new Map();
  DateTime get startTime => _data["start_time"];
  DateTime get endTime => _data["end_time"];
  Map<String, UserState> get userStates => _data["user_states"];

 // UserState getUserState(String user_id) => userStates.firstWhere((us) => us.userId == user_id, orElse: () => null);

  bool get isPopulated => userStates.values.firstWhere((us) => us.state != null, orElse: () => null) != null;

  void set startTime(DateTime value) { _data["start_time"] = value; }
  void set endTime(DateTime value) { _data["end_time"] = value; }
  void set userStates(Map<String, UserState> value) { _data["user_states"] = value; }
}

class UserState
{
  UserState(this.userId)
  {
    bookingId = null;
    state = null;
  }

  UserState.decode(Map<String, String> data) : userId = data["user_id"]
  {
    bookingId = data["booking_id"];
    state = data["state"];
  }

  Map<String, String> get encoded => {"user_id" : userId, "booking_id" : bookingId, "state" : state};

  final String userId;
  String bookingId;
  String state;
}