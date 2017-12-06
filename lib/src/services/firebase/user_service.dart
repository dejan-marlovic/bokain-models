part of firebase_service;

@Injectable()
class UserService extends FirebaseServiceBase<User>
{
  UserService() :
        super("users",
          [
            new UniqueField("users_emails", "email", true),
            new UniqueField("users_phones", "phone", true),
            new UniqueField("users_social_numbers", "social_number", true)
          ]);

  Future<String> login(String email, String password) async
  {
    String errorMessage;
    _loading = true;
    try
    {
      _currentUser = await firebase.auth().signInWithEmailAndPassword(email, password);
      if (_currentUser.emailVerified == false) throw new Exception("The user is not email verified");
    }
    catch (e)
    {
      errorMessage = e.toString();
      _currentUser = null;
    }
    _loading = false;
    return errorMessage;
  }

  @override
  User createModelInstance(String id, Map<String, dynamic> data) => (data == null) ? new User(id) : new User.decode(id, data);

  Future patchCustomers(User user) async
  {
    _loading = true;
    await _db.ref(_name).child(user.id).child("customer_ids").set(user.customer_ids);
    _loading = false;
  }

  Future patchSalons(User user) async
  {
    _loading = true;
    await _db.ref(_name).child(user.id).child("salon_ids").set(user.salon_ids);
    _loading = false;
  }

  Future patchServices(User user) async
  {
    _loading = true;
    await _db.ref(_name).child(user.id).child("service_ids").set(user.service_ids);
    _loading = false;
  }

  Future patchBookings(User user) async
  {
    _loading = true;
    await _db.ref(_name).child(user.id).child("booking_ids").set(user.booking_ids);
    _loading = false;
  }

  Future<String> uploadImage(String user_id, String base64) async
  {
    String url = null;
    try
    {
      _loading = true;
      List<String> parts = base64.split(";base64,");
      String contentType = parts.first.substring("data:".length);
      String data = parts.last;

      String filename = Uri.encodeFull(user_id);
      final firebase.UploadMetadata metadata = new firebase.UploadMetadata(contentType: contentType);
      await _profileImagesRef.child(filename).putString(data, "base64", metadata).future;
      url = (await _profileImagesRef.child(filename).getDownloadURL()).toString();
    }
    finally
    {
      _loading = false;
      return url;
    }
  }

  bool get isLoggedIn => (_currentUser != null && _currentUser.emailVerified);

  String get currentUserEmail  => _currentUser?.email;
  firebase.User _currentUser;
  final firebase.StorageReference _profileImagesRef = firebase.storage().ref("user-profile-images");
}