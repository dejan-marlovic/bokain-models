import 'dart:async';
import 'dart:convert';
import 'package:angular2/angular2.dart';
import 'package:http/http.dart' as http show Response;
import 'package:http/browser_client.dart';

@Injectable()
class AuthService
{
  AuthService();

  bool get isLoading => _loading;

  Future<String> loginWithEmailPassword(String email, String password) async
  {
    _loading = true;
    String newToken = await _post("login_with_email_password_basic", {"email":email, "password":password});
    _loading = false;
    return newToken;
  }

  Future<String> loginWithToken(String token) async
  {
    _loading = true;
    String newToken = await _post("login_with_token", {"token":token});
    _loading = false;
    return newToken;
  }

  Future<String> register(String email, String firstname, String lastname, [String password = null]) async
  {
    _loading = true;
    Map<String, String> requestBody = new Map();
    requestBody["email"] = email;
    requestBody["firstname"] = firstname;
    requestBody["lastname"] = lastname;
    if (password != null) requestBody["password"] = password;
    String newToken = await _post("register", requestBody);
    _loading = false;
    return newToken;
  }

  Future<String> resetPassword(String email, String token, String new_password) async
  {
    _loading = true;
    String newToken = await _post("reset_password", {"email":email, "token":token, "password":new_password});
    _loading = false;
    return newToken;
  }

  Future<String> resetToken(String email) async
  {
    _loading = true;
    String newToken = await _post("reset_token", {"email":email});
    _loading = false;
    return newToken;
  }

  Future unregister(String email) async
  {
    _loading = true;
    await _post("unregister", {"email":email});
    _loading = false;
  }

  Future<dynamic> _post(String verb, Map<String, String> request_body) async
  {
    request_body["client"] = "bokain";
    _loading = true;

    final BrowserClient _authClient = new BrowserClient();
    http.Response response = await _authClient.post("https://auth.minoch.com/v1/users/$verb", body: request_body);
    dynamic responseBody = JSON.decode(response.body);
    _loading = false;
    if (response.statusCode != 200) throw new Exception("(${response.statusCode.toString()}) ${responseBody['error']}");
    return responseBody;
  }

  bool _loading = false;
}