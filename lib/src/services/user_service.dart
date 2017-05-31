part of model_service;

@Injectable()
class UserService extends ModelService
{
  UserService() : super("users");

  Future<String> login(String email, String password) async
  {
    String errorMessage;
    _loading = true;
    try
    {
      _currentUser = await firebase.auth().signInWithEmailAndPassword(email, password);

      //await _currentUser.sendEmailVerification();
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
  Future<String> push(ModelBase model) async
  {
    _loading = true;
    try
    {
      firebase.User user = await firebase.auth().createUserWithEmailAndPassword((model as User).email, (model as User).password);
      await user.sendEmailVerification();
    } catch(e)
    {
      _loading = false;

      throw (e);
    }
    return await super.push(model);
  }

  @override
  User createModelInstance(String id, Map<String, dynamic> data)
  {
    return new User.decode(id, data);
  }

  Future patchCustomers(User user) async
  {
    _loading = true;
    await _ref.child(user.id).child("customer_ids").set(user.customerIds);
    _loading = false;
  }

  Future patchSalons(User user) async
  {
    _loading = true;
    await _ref.child(user.id).child("salon_ids").set(user.salonIds);
    _loading = false;
  }

  Future patchServices(User user) async
  {
    _loading = true;
    await _ref.child(user.id).child("service_ids").set(user.serviceIds);
    _loading = false;
  }

  Future patchBookings(User user) async
  {
    _loading = true;
    await _ref.child(user.id).child("booking_ids").set(user.bookingIds);
    _loading = false;
  }

  bool get isLoggedIn => (_currentUser != null && _currentUser.emailVerified);

  firebase.User _currentUser;
}