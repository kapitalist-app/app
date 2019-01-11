import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:kapitalist/api/kapitalist_api.dart';
import 'package:kapitalist/models/register_login_data.dart';

class AuthenticationBloc {
  // Backing Api
  final KapitalistApi _api;

  // Inputs
  Sink<RegisterLoginData> get login => _loginController.sink;
  Sink<RegisterLoginData> get register => _registerController.sink;

  // Outputs
  Stream<bool> get loginState => _loginStateSubject.stream;
  Stream<String> get userName => _userNameSubject.stream;

  // Private
  final _loginController = StreamController<RegisterLoginData>();
  final _registerController = StreamController<RegisterLoginData>();

  final _loginStateSubject = BehaviorSubject<bool>();
  final _userNameSubject = BehaviorSubject<String>();

  AuthenticationBloc(this._api) {
    // Set initial state
    // XXX: TODO

    // Wire up input streams
    _loginController.stream.listen(_onLogin);
    _registerController.stream.listen(_onRegister);
  }

  void _onLogin(RegisterLoginData data) async {
    try {
      await _api.login(data.email, data.password);
      _loginStateSubject.sink.add(true);
      _userNameSubject.sink.add(data.email);
    } catch (e) {
      print(e);
    }
  }

  void _onRegister(RegisterLoginData data) async {
    try {
      await _api.register(data.email, data.password);
      _loginStateSubject.sink.add(true);
      _userNameSubject.sink.add(data.email);
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _loginController.close();
    _registerController.close();

    _loginStateSubject.close();
    _userNameSubject.close();
  }
}
