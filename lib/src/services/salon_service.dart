part of model_service;

@Injectable()
class SalonService extends ModelService
{
  SalonService() : super("salons")
  {
    _db.ref('rooms').onChildAdded.listen(_onRoomAdded);
    _db.ref('rooms').onChildChanged.listen(_onRoomChanged);
    _db.ref('rooms').onChildRemoved.listen(_onRoomRemoved);
  }

  @override
  Salon createModelInstance(String id, Map<String, dynamic> data) => new Salon.decode(id, data);

  Future<String> pushRoom(Room model) async
  {
    model.created = new DateTime.now();
    model.addedBy = firebase.auth().currentUser.uid;
    _loading = true;
    String id = await _db.ref('rooms').push(model.encoded).key;
    _loading = false;
    return id;
  }

  Room getRoom(String id) => _rooms.containsKey(id) ? _rooms[id] : null;

  Iterable<Room> getRooms(List<String> ids) => _rooms.keys.where(ids.contains).map((id) => getRoom(id));

  Future removeRoom(String id) async
  {
    _loading = true;
    await _db.ref('rooms').child(id).remove();
    _loading = false;
  }

  Future setRoom(String id) async
  {
    _loading = true;
    await _db.ref('rooms').child(id).set(getRoom(id).data);
    _loading = false;
  }

  Future patchBookings(Salon salon) async
  {
    _loading = true;
    await _ref.child(salon.id).child("booking_ids").set(salon.bookingIds);
    _loading = false;
  }

  Future patchUsers(Salon salon) async
  {
    _loading = true;
    await _ref.child(salon.id).child("user_ids").set(salon.userIds);
    _loading = false;
  }

  List<String> getServiceIds(Salon s)
  {
    Set<String> ids = new Set();
    for (String room_id in s.roomIds)
    {
      ids.addAll(getRoom(room_id)?.serviceIds);
    }
    return ids.toList(growable: false);
  }

  void _onRoomAdded(firebase.QueryEvent e)
  {
    _rooms[e.snapshot.key] = new Room.decode(e.snapshot.key, e.snapshot.val());
  }

  void _onRoomChanged(firebase.QueryEvent e)
  {
    _rooms[e.snapshot.key] = new Room.decode(e.snapshot.key, e.snapshot.val());
  }

  void _onRoomRemoved(firebase.QueryEvent e)
  {
    _rooms.remove(e.snapshot.key);

    /*
    Salon salon = selectedModel as Salon;
    salon.roomIds.remove(e.snapshot.key);
    _ref.child(_selectedModel.id).child("room_ids").set(salon.roomIds);
    */
  }

  Future patchRooms(Salon salon) async
  {
    await _ref.child(salon.id).child("room_ids").set(salon.roomIds);
  }

  Map<String, Room> _rooms = new Map();
}