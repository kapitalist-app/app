import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/api/auth_api.dart';
import 'package:business/auth/actions/auth_completed_action.dart';
import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_token.dart';
import 'package:business/auth/models/auth_type.dart';
import 'package:flutter/material.dart';

class DoAuthAction extends ReduxAction<AppState> {
  final AuthType type;
  final AuthData data;

  DoAuthAction(this.type, this.data);

  @override
  Future<AppState> reduce() async {
    final url = state.baseUrl;
    final api = AuthApi(url);

    // FIXME: api currently throws
    AuthToken token;
    switch (this.type) {
      case AuthType.REGISTER:
        token = await api.register(this.data);
        break;
      case AuthType.LOGIN:
        token = await api.login(this.data);
        break;
    }

    debugPrint('doauth: token=$token');

    // FIXME: check if we need this action or if we only need to dispatch if auth was successful
    await store.dispatchFuture(AuthCompletedAction(token));

    if (token != null) {
      return state.rebuild((b) => b.auth
        ..token = token.toBuilder()
        ..data = this.data.toBuilder());
    }
    return null;
  }
}
