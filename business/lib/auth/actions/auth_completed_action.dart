import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_state.dart';
import 'package:business/auth/models/auth_token.dart';

class AuthCompletedAction extends ReduxAction<AppState> {
  final AuthToken token;

  AuthCompletedAction(this.token);

  @override
  AppState reduce() {
    if (token != null) {
      // FIXME: refresh cashes
    }
    return null;
  }
}
