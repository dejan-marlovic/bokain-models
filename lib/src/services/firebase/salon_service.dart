part of firebase_service;

@Injectable()
class SalonService extends FirebaseServiceBase
{
  SalonService() : super("salons")
  {
    _db.ref('rooms').onChildAdded.listen(_onRoomAdded);
    _db.ref('rooms').onChildChanged.listen(_onRoomChanged);
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

  Future setRoom(String id) async
  {
    _loading = true;
    await _db.ref('rooms').child(id).set(getRoom(id).encoded);
    _loading = false;
  }

  Future patchBookings(Salon salon) async
  {
    _loading = true;
    await _db.ref(_name).child(salon.id).child("booking_ids").set(salon.bookingIds);
    _loading = false;
  }

  Future patchUsers(Salon salon) async
  {
    _loading = true;
    await _db.ref(_name).child(salon.id).child("user_ids").set(salon.userIds);
    _loading = false;
  }

  List<String> getServiceIds(Salon s)
  {
    Set<String> ids = new Set();
    if (s == null) return null;
    for (String room_id in s.roomIds)
    {
      Room r = getRoom(room_id);
      if (r != null && r.serviceIds != null && r.serviceIds.isNotEmpty) ids.addAll(r.serviceIds);
    }
    return ids.toList(growable: false);
  }

  Future<String> uploadImage(String salon_name, String company_name, String base64) async
  {
    String url = null;
    try
    {
      _loading = true;
      List<String> parts = base64.split(";base64,");
      String contentType = parts.first.substring("data:".length);
      String data = parts.last;

      String filename = Uri.encodeFull("${salon_name}_${company_name}");
      final firebase.UploadMetadata metadata = new firebase.UploadMetadata(contentType: contentType);
      await _logosRef.child(filename).putString(data, "base64", metadata).future;
      url = (await _logosRef.child(filename).getDownloadURL()).toString();
    }
    finally
    {
      _loading = false;
      return url;
    }
  }

  Future removeImage(String salon_name, String company_name) async
  {
    try
    {
      _loading = true;
      String filename = Uri.encodeFull("${salon_name}_${company_name}");
      await _logosRef.child(filename).delete();
    }
    finally { _loading = false; }
  }

  void _onRoomAdded(firebase.QueryEvent e)
  {
    _rooms[e.snapshot.key] = new Room.decode(e.snapshot.key, e.snapshot.val());
  }

  void _onRoomChanged(firebase.QueryEvent e)
  {
    _rooms[e.snapshot.key] = new Room.decode(e.snapshot.key, e.snapshot.val());
  }

  Future patchRooms(Salon salon) async
  {
    await _db.ref(_name).child(salon.id).child("room_ids").set(salon.roomIds);
  }

  final firebase.StorageReference _logosRef = firebase.storage().ref("salon-logos");
  Map<String, Room> _rooms = new Map();
}