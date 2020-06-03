import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_token.dart';

class Api {
  // Constructor
  const Api();

  Future<String> get(Uri url, {AuthToken token, bool retry = false}) async {
    final headers = _getHeaders(token: token);
    return http.get(url, headers: headers).then((resp) {
      _printResponse(resp);
      final body = resp.body;
      final code = resp.statusCode;

      if (code == HttpStatus.unauthorized || code >= 400) {
        print("Error while GETing ${url}: ${code} - ${body}");
        return null;
      }

      return body;
    });
  }

  Future<String> post(Uri url,
      {String payload, AuthToken token}) async {
    return http
        .post(url, body: payload, headers: _getHeaders(token: token))
        .then((resp) {
      _printResponse(resp);
      final body = resp.body;
      final code = resp.statusCode;

      if (code == HttpStatus.unauthorized || code >= 400) {
        print("Error while POSTing ${url}: ${code} - ${body}");
        return null;
      }

      return body;
    });
  }

  Map<String, String> _getHeaders({AuthToken token}) {
    var map = {HttpHeaders.contentTypeHeader: 'application/json'};
    if (token != null) {
      map.addAll({HttpHeaders.authorizationHeader: 'Bearer ${token}'});
    }
    return map;
  }

  void _printResponse(http.Response resp) {
    var req = resp.request as http.Request;
    print("${req.method} ${req.url}");
    print("H: ${req.headers ?? '--'}");
    print("P: ${req.body ?? '--'}");
    print("=> ${resp.statusCode} - ${resp.body ?? '--'}");
  }
}
