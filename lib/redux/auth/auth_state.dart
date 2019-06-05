import 'package:meta/meta.dart';

class AuthState {
  final String email;
  final String password;

  // XXX: Decide if this is useful
  bool get loggedIn => email != null;

  const AuthState({
    @required this.email,
    @required this.password,
  });

  factory AuthState.initial() {
    return AuthState(
      email: null,
      password: null,
    );
  }
}
