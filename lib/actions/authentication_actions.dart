import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/kapitalist_token.dart';
import 'package:kapitalist/models/common/signup_state.dart';

@immutable
class AuthenticationRequestedAction {
  final SignupState signupState;
  final String email;
  final String password;

  AuthenticationRequestedAction(
    this.signupState,
    this.email,
    this.password,
  );

  @override
  String toString() =>
    'AuthenticationRequestedAction{signupState: $signupState, email: $email, password: $password}';
}

@immutable
class AuthenticationCompletedAction {
  final KapitalistToken token;

  AuthenticationCompletedAction(
      this.token,
  );

  @override
  String toString() =>
      'AuthenticationCompletedAction{token: $token}';
}