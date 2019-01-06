import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:kapitalist/models/api/api_models.dart';

class KapitalistApi {
  // Base Uri
  // TODO: read this from user and save in shared prefs
  static final BASE_URI = new Uri.https('10.0.2.2:3000', '/');

  // Authentication related
  String _email;
  String _password;
  KapitalistToken _token;

  // Constructor
  KapitalistApi();

  Map<String, String> _getHeaders(bool withToken) {
    var map = {HttpHeaders.contentTypeHeader: 'application/json'};
    if (withToken) {
      map.addAll({HttpHeaders.authorizationHeader: 'Bearer: ${_token.token}'});
    }
    return map;
  }

  Future<KapitalistToken> register(String email, String password) async {
    // Save credentials for possible token refresh
    _email = email;
    _password = password;

    // Do register
    print('Performing request: ${BASE_URI.replace(path: '/register')}');
    final resp = await http.post(BASE_URI.replace(path: '/register'),
        headers: _getHeaders(false),
        body: json.encode({
          'email': _email,
          'password': _password,
          'name': _email,
        }));
    if (resp.statusCode != HttpStatus.ok) {
      throw new Exception("Unauthorized");
    }

    // Get token
    return _refreshToken();
  }

  Future<KapitalistToken> login(String email, String password) async {
    // Save credentials for possible token refresh
    _email = email;
    _password = password;

    // Get token
    return _refreshToken();
  }

  Future<KapitalistToken> _refreshToken() async {
    final resp = await http.post(BASE_URI.replace(path: '/token'),
        headers: _getHeaders(false),
        body: json.encode({
          'email': _email,
          'password': _password,
        }));
    if (resp.statusCode != HttpStatus.ok) {
      throw new Exception("Unauthorized");
    }
    print(resp.body);
    print(json.decode(resp.body));
    _token = json.decode(resp.body);
    return _token;
  }

  Future<dynamic> _get(String url) async {
    return http
        .get(BASE_URI.replace(path: url), headers: _getHeaders(true))
        .then((resp) {
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized) {
        // Retry? but only once
      } else if (code > 400) {
        throw new Exception("Error while fetching data..");
      }

      return json.decode(body);
    });
  }
}
