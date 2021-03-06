part of firebase_service;

@Injectable()
class SalonService extends FirebaseServiceBase<Salon>
{
  SalonService() : super("salons", [new UniqueField("salons_names", "name", true)])
  {
    _db.ref('rooms').onChildAdded.listen(_onRoomAdded);
    _db.ref('rooms').onChildChanged.listen(_onRoomChanged);
  }

  @override
  Salon createModelInstance(Map<String, dynamic> data)
  {
    Salon model = new Salon();
    if (data != null) model.addAll(data);
    return model;
  }

  Future<String> pushRoom(Room model) async
  {
    model.created = new DateTime.now();
    model["created"] = timestamp.format(model.created);
    model.added_by = firebase.auth().currentUser.uid;
    _loading = true;
    model.id = (await _db.ref('rooms').push(model.toMap())).key;
    _loading = false;
    return model.id;
  }

  Room getRoom(String id) => _rooms.containsKey(id) ? _rooms[id] : null;

  Iterable<Room> getRooms(List<String> ids) => _rooms.keys.where(ids.contains).map((id) => getRoom(id));

  Future setRoom(String id) async
  {
    _loading = true;
    await _db.ref('rooms').child(id).set(getRoom(id).toMap());
    _loading = false;
  }

  Future patchBookings(Salon salon) async
  {
    _loading = true;
    await _db.ref(_name).child(salon.id).child("booking_ids").set(salon.booking_ids);
    _loading = false;
  }

  Future patchUsers(Salon salon) async
  {
    _loading = true;
    await _db.ref(_name).child(salon.id).child("user_ids").set(salon.user_ids);
    _loading = false;
  }

  List<String> getServiceIds(Salon s)
  {
    Set<String> ids = new Set();
    if (s == null) return null;
    for (String room_id in s.room_ids)
    {
      Room r = getRoom(room_id);
      if (r != null && r.service_ids != null && r.service_ids.isNotEmpty) ids.addAll(r.service_ids);
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

  void _onRoomAdded(firebase.QueryEvent e)
  {
    Map<String, dynamic> data = e.snapshot.val();
    data["created"] = DateTime.parse(data["created"]);

    _rooms[e.snapshot.key] = new Room()..fromMap(data);
  }

  void _onRoomChanged(firebase.QueryEvent e)
  {
    Map<String, dynamic> data = e.snapshot.val();
    data["created"] = DateTime.parse(data["created"]);

    _rooms[e.snapshot.key] = new Room()..fromMap(data);
  }

  Future patchRooms(Salon salon) async
  {
    await _db.ref(_name).child(salon.id).child("room_ids").set(salon.room_ids);
  }

  final firebase.StorageReference _logosRef = firebase.storage().ref("salon-logos");
  Map<String, Room> _rooms = new Map();
}