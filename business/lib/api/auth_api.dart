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
    // FIXME: currently we throw away the user response, might want to use this later
    if (await api.post(url, payload: data.toJson()) != null) {
      return login(data);
    }
    return null;
  }

  Future<AuthToken> login(AuthData data) async {
    final url = baseUrl.replace(path: '/token');
    final resp = await api.post(url, payload: data.toJson());
    if (resp != null) {
      return AuthToken.fromJson(resp);
    }
    return null;
  }

  // Fields
  final Api api = const Api();
  final Uri baseUrl;
}
