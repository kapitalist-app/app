import 'package:built_value/built_value.dart';

import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_token.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  // Fields
  @nullable
  AuthToken get token;

  @nullable
  AuthData get data;

  // Derived getters
  bool get authenticated => token.token?.isNotEmpty;

  // Constructors
  AuthState._();

  factory AuthState([updates(AuthStateBuilder b)]) = _$AuthState;

  // Initial state
  static AuthState initial() {
    return AuthState((b) => b
      ..token = null
      ..data = null);
  }
}
