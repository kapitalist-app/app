import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_state.dart';

class AuthCompletedAction extends ReduxAction<AppState> {
  final bool success;
  final AuthData data;

  AuthCompletedAction(this.success, this.data);

  @override
  AppState reduce() {
    if (this.success) {
      final auth = AuthState(email: this.data.email, password: this.data.email);
      return state.copyWith(authState: auth);
    }

    // FIXME: Handle error case
    return null;
  }
}
