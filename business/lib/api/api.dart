import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:business/auth/models/auth_token.dart';

class Api {
  // Constructor
  const Api();
  
  Future<bool> checkBaseUrl(Uri baseUrl) async {
    final url = baseUrl.replace(path: '/version');
    return http.get(url).then((resp) {
      _printResponse(resp);
      return resp.statusCode == HttpStatus.ok && resp.body.contains('kapitalist v');
    });
  }

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
    debugPrint("${req.method} ${req.url}");
    debugPrint("H: ${req.headers ?? '--'}");
    debugPrint("P: ${req.body ?? '--'}");
    debugPrint("=> ${resp.statusCode} - ${resp.body ?? '--'}");
  }
}
