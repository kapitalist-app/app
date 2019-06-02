import 'package:http/http.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/models/register_login_data.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/auth/auth_actions.dart';
import 'package:kapitalist/redux/common/common_actions.dart';

class AuthMiddleware extends MiddlewareClass<AppState> {
  static const String KEY_EMAIL = "__email__";
  static const String KEY_PASSWORD = "__password__";

  final Client client;
  final KeyValueStore kvStore;

  AuthMiddleware(this.client, this.kvStore);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitAction) {
      await _loadCredentials(store);
    } else if (action is DoAuthAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.apiState.api;
      // XXX: api currently throws
      var success = false;
      switch (action.type) {
        case AuthType.REGISTER:
          success = await api.register(action.data.email, action.data.password);
          break;
        case AuthType.LOGIN:
          success = await api.login(action.data.email, action.data.password);
          break;
      }
      if (success) {
        _saveCredentials(action.data);
        store.dispatch(AuthSuccessfulAction(action.data));
      } else {
        store.dispatch(AuthFailedAction());
      }
    }
    next(action);
  }

  Future<Null> _loadCredentials(Store<AppState> store) async {
    final email = kvStore.getString(KEY_EMAIL);
    final password = kvStore.getString(KEY_PASSWORD);

    if (email != null && password != null) {
      print("Loaded credentials: email=$email, password=$password");

      final data = RegisterLoginData((b) => b
        ..email = email
        ..password = password);
      store.dispatch(DoAuthAction(AuthType.LOGIN, data));
    }
  }

  Future<Null> _saveCredentials(RegisterLoginData data) async {
    await kvStore.setString(KEY_EMAIL, data.email);
    await kvStore.setString(KEY_PASSWORD, data.password);
    print("Saved credentials: email=${data.email}, password=${data.password}");
  }
}
