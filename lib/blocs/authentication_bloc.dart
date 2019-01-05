import 'dart:async';

import 'package:rxdart/rxdart.dart';

class LoginRegisterData {
  final String email;
  final String password;

  LoginRegisterData(this.email, this.password);
}

class AuthenticationBloc {
  // Inputs
  final Sink<LoginRegisterData> login;
  final Sink<LoginRegisterData> register;

  // Outputs
  Stream<bool> get loginState => _loginStateSubject.stream;

  // Private
  final _loginStateSubject = BehaviorSubject<bool>();

  AuthenticationBloc._(
    this.login,
    this.register,
  );

  factory AuthenticationBloc(/*KapitalistApi api*/) {
    final login = StreamController<LoginRegisterData>(sync: true);
    final register = StreamController<LoginRegisterData>(sync: true);

    login.stream.listen((loginData) {
      print('LOGIN: ${loginData.email}:${loginData.password}');
    });

    return AuthenticationBloc._(
      login,
      register
    );
  }

  void dispose() {
    login.close();
    register.close();

    _loginStateSubject.close();
  }
}
