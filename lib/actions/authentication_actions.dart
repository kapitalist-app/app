import 'package:meta/meta.dart';

@immutable
class RequestLoginAction {
  final String email;
  final String password;

  RequestLoginAction(
    this.email,
    this.password,
  );

  @override
  String toString() =>
    'RequestLoginAction{email: $email, password: $password}';
}

@immutable
class RequestRegisterAction {
  final String email;
  final String password;

  RequestRegisterAction(
    this.email,
    this.password,
  );

  @override
  String toString() =>
    'RequestRegisterAction{email: $email, password: $password}';
}
