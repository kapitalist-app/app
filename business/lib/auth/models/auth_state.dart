import 'package:meta/meta.dart';

import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_token.dart';

class AuthState {
  // Constructor
  const AuthState({
    @required this.token,
    @required this.data,
  });

  // Properties
  bool get authenticated => (token.token ?? '').isNotEmpty;

  // Factories
  factory AuthState.initial() {
    return AuthState(
      token: null,
      data: null,
    );
  }

  // Fields
  final AuthToken token;
  final AuthData data;
}
