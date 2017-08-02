import 'dart:async';
import 'dart:convert' show JSON;
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http show Response;

/**
 * Base class for any service utilizing the bokain RESTful api (https://api.bokain.se/index.php/)
 */
abstract class RestfulServiceBase
{
  RestfulServiceBase();

  Future<Map<String, dynamic>> httpGET(String url) async
  {
    _loading = true;
    http.Response response = await _client.get(_apiBase + url);
    _loading = false;
    return _decode(response);
  }

  Future<dynamic> httpPOST(String url, Map<String, String> body) async
  {
    _loading = true;
    http.Response response = await _client.post(_apiBase + url, body: JSON.encode(body));
    _loading = false;

    return _decode(response);
  }

  /**
   * Returns the id of the added resource
   */
  Future<String> httpPUT(String url, Map<String, String> body) async
  {
    _loading = true;
    http.Response response = await _client.put(_apiBase + url, body: JSON.encode(body));
    _loading = false;
    return _decode(response);
  }

  Future httpDELETE(String url) async
  {
    _loading = true;
    http.Response response = await _client.delete(_apiBase + url);
    _loading = false;
    _decode(response);
  }

  dynamic _decode(http.Response response)
  {
    if (response.statusCode != 200) throw new Exception("${response.body} (http status: ${response.statusCode})");
    return response.body.isEmpty ? null : JSON.decode(response.body);
  }

  bool get loading => _loading;
  bool _loading = false;

  final String _apiBase = "https://api.bokain.se/index.php/";
  final BrowserClient _client = new BrowserClient();
}