import 'package:meta/meta.dart';

class AuthState {
  const AuthState({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;

  // XXX: Decide if this is useful
  bool get loggedIn => email != null;

  factory AuthState.initial() {
    return AuthState(
      email: null,
      password: null,
    );
  }
}
