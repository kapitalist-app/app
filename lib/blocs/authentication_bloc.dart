import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:kapitalist/api/kapitalist_api.dart';

class LoginRegisterData {
  final String email;
  final String password;

  LoginRegisterData(this.email, this.password);
}

class AuthenticationBloc {
  // Backing Api
  final KapitalistApi _api;

  // Inputs
  Sink<LoginRegisterData> get login => _loginController.sink;
  Sink<LoginRegisterData> get register => _registerController.sink;

  // Outputs
  Stream<bool> get loginState => _loginStateSubject.stream;

  // Private
  final _loginController = StreamController<LoginRegisterData>();
  final _registerController = StreamController<LoginRegisterData>();

  final _loginStateSubject = BehaviorSubject<bool>();

  AuthenticationBloc(this._api) {
    // Set initial state
    // XXX: TODO

    // Wire up input streams
    _loginController.stream.listen(_performLogin);
    _registerController.stream.listen(_performRegister);
  }

  void _performLogin(LoginRegisterData data) async {
    print('LOGIN: ${data.email}:${data.password}');
    try {
      final token = await _api.login(data.email, data.password);
      print('TOKEN: ${token}');
      _loginStateSubject.sink.add(true);
    } catch (e) {
      print(e);
    }
  }

  void _performRegister(LoginRegisterData data) async {
    print('REGISTER: ${data.email}:${data.password}');
    try {
      final token = await _api.register(data.email, data.password);
      print('TOKEN: ${token}');
      _loginStateSubject.sink.add(true);
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _loginController.close();
    _registerController.close();

    _loginStateSubject.close();
  }
}
