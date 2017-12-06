part of model_base;

class Increment
{
  static const Duration duration = const Duration(minutes: 10);

  Increment(DateTime startTime)
  {
    start_time = startTime;
    end_time = start_time.add(duration);
    user_states = new Map<String, UserState>();
  }

  Increment.decode(Map<String, dynamic> d)
  {
    start_time = DateTime.parse(d["start_time"]);
    end_time = DateTime.parse(d["end_time"]);
    Map<String, Map<String, String>> userStateTable = d["user_states"];
    user_states = new Map<String, UserState>();
    if (userStateTable == null) user_states = new Map();
    else userStateTable.keys.forEach((id) => user_states[id] = new UserState.decode(userStateTable[id]));
  }

  Map<String, dynamic> get encoded
  {
    Map<String, dynamic> output = new Map();
    output["user_states"] = new Map<String, Map<String, String>>();
    user_states.keys.forEach((id) => output["user_states"][id] = user_states[id].encoded);
    return output;
  }

  Map<String, dynamic> data = new Map();
  DateTime get start_time => data["start_time"];
  DateTime get end_time => data["end_time"];
  Map<String, UserState> get user_states => data["user_states"];

  bool get isPopulated => user_states.values.firstWhere((us) => us.state != null, orElse: () => null) != null;

  void set start_time(DateTime value) { data["start_time"] = value; }
  void set end_time(DateTime value) { data["end_time"] = value; }
  void set user_states(Map<String, UserState> value) { data["user_states"] = value; }
}

class UserState
{
  UserState(this.user_id)
  {
    booking_id = null;
    state = null;
  }

  UserState.decode(Map<String, String> data) : user_id = data["user_id"]
  {
    booking_id = data["booking_id"];
    state = data["state"];
  }

  @override
  bool operator ==(dynamic other) => (hashCode == other.hashCode);

  @override
  int get hashCode => JSON.encode(encoded).hashCode;

  Map<String, String> get encoded => {"user_id" : user_id, "booking_id" : booking_id, "state" : state};

  final String user_id;
  String booking_id;
  String state;
}