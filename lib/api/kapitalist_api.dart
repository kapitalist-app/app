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

  Map<String, String> _getHeaders() {
    return {HttpHeaders.AUTHORIZATION: 'Bearer: ${_token.token}'};
  }

  Future<KapitalistToken> register(String email, String password) async {
    // Save credentials for possible token refresh
    _email = email;
    _password = password;

    // Do register
    http.Response resp = await http.post(BASE_URI.replace(path: '/register'), body: {
      'email': email,
      'password': password,
    });
    return json.decode(resp.body);
  }

  Future<dynamic> get(String url) async {
    return http
        .get(BASE_URI.replace(path: url), headers: _getHeaders())
        .then((resp) {
        final String body = resp.body;
        final int code = resp.statusCode;

        if (code == HttpStatus.UNAUTHORIZED) {
          // Retry? but only once
        }
        else if (code > 400) {
          throw new Exception("Error while fetching data..");
        }

        return json.decode(body);
    });
  }
}