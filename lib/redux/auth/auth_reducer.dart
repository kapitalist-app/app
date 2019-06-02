import 'package:kapitalist/redux/auth/auth_actions.dart';
import 'package:kapitalist/redux/auth/auth_state.dart';

AuthState authReducer(AuthState state, dynamic action) {
  if (action is AuthSuccessfulAction) {
    return AuthState(email: action.data.email, password: action.data.password);
  }

  return state;
}
