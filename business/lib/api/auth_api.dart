import 'dart:async';

import 'package:business/api/api.dart';
import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_token.dart';

class AuthApi {
  // Constructor
  const AuthApi(
    this.baseUrl,
  );

  // Methods
  Future<AuthToken> register(AuthData data) async {
    final url = baseUrl.replace(path: '/register');
    final resp = await api.post(url, payload: data.toJson());
    return AuthToken.fromJson(resp);
  }

  Future<AuthToken> login(AuthData data) async {
    final url = baseUrl.replace(path: '/login');
    final resp = await api.post(url, payload: data.toJson());
    return AuthToken.fromJson(resp);
  }

  // Fields
  final Api api = const Api();
  final Uri baseUrl;
}
