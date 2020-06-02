import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/auth/actions/auth_completed_action.dart';
import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_type.dart';

class DoAuthAction extends ReduxAction<AppState> {
  final AuthType type;
  final AuthData data;

  DoAuthAction(this.type, this.data);

  @override
  Future<AppState> reduce() async {
    // XXX: Check if this is okay or if api might be "old state"
    final api = state.api.api;

    // XXX: api currently throws
    var success = false;
    switch (this.type) {
      case AuthType.REGISTER:
        success = await api.register(this.data.email, this.data.password);
        break;
      case AuthType.LOGIN:
        success = await api.login(this.data.email, this.data.password);
        break;
    }

    store.dispatch(AuthCompletedAction(success, this.data));

    return null;
  }
}
