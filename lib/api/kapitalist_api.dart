import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:kapitalist/models/auth_token.dart';
import 'package:kapitalist/models/register_login_data.dart';

class KapitalistApi {
  // Base Uri
  // TODO: read this from user and save in shared prefs
  static final BASE_URI = new Uri.http('10.0.2.2:3000', '/');

  // Authentication related
  String _email;
  String _password;
  AuthToken _token;

  // Constructor
  KapitalistApi();

  Map<String, String> _getHeaders(bool withToken) {
    var map = {HttpHeaders.contentTypeHeader: 'application/json'};
    if (withToken) {
      map.addAll({HttpHeaders.authorizationHeader: 'Bearer: ${_token.token}'});
    }
    return map;
  }

  Future<AuthToken> register(String email, String password) async {
    // Save credentials for possible token refresh
    _email = email;
    _password = password;

    // Do register
    final req = RegisterLoginData((b) => b
          ..email = _email
          ..password = _password).toJson();
    // XXX: Replace this with _post
    final resp = await http.post(BASE_URI.replace(path: '/register'),
        headers: _getHeaders(false),
        body: req);
    if (resp.statusCode != HttpStatus.ok) {
      throw new Exception("Unauthorized");
    }

    // Get token
    return _refreshToken();
  }

  Future<AuthToken> login(String email, String password) async {
    // Save credentials for possible token refresh
    _email = email;
    _password = password;

    // Get token
    return _refreshToken();
  }

  Future<AuthToken> _refreshToken() async {
    final req = RegisterLoginData((b) => b
          ..email = _email
          ..password = _password).toJson();

    final resp = await http.post(BASE_URI.replace(path: '/token'),
        headers: _getHeaders(false),
        body: req);
    if (resp.statusCode != HttpStatus.ok) {
      throw new Exception("Unauthorized");
    }
    _token = AuthToken.fromJson(resp.body);
    return _token;
  }

  Future<String> _get(String url, {bool retry = false}) async {
    return http
        .get(BASE_URI.replace(path: url), headers: _getHeaders(true))
        .then((resp) {
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized && !retry) {
        // Refresh token and retry once
        return _refreshToken().then((_) => _get(url, retry: true));
      } else if (code > 400) {
        throw new Exception(
            "Error while GETing ${BASE_URI.replace(path: url)}");
      }

      return body;
    });
  }

  Future<String> _post(String url, String payload, {bool retry = false}) async {
    return http
        .post(BASE_URI.replace(path: url),
            body: payload, headers: _getHeaders(true))
        .then((resp) {
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized && !retry) {
        // Refresh token and retry once
        return _refreshToken().then((_) => _post(url, payload, retry: true));
      } else if (code > 400) {
        throw new Exception(
            "Error while POSTing ${BASE_URI.replace(path: url)}");
      }

      return body;
    });
  }
}
