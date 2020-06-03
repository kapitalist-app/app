import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_state.dart';
import 'package:business/auth/models/auth_token.dart';

class AuthCompletedAction extends ReduxAction<AppState> {
  final AuthToken token;
  final AuthData data;

  AuthCompletedAction(this.token, this.data);

  @override
  AppState reduce() {
    final auth = AuthState(token: this.token, data: this.data);
    return state.copyWith(authState: auth);
  }
}
