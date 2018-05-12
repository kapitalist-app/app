import 'package:redux/redux.dart';
import 'package:kapitalist/actions/actions.dart';
import 'package:kapitalist/models/state/user_state.dart';

final userReducer = combineReducers<UserState>([
  new TypedReducer<UserState, AuthenticationRequestedAction>(_authenticationRequested),
  new TypedReducer<UserState, AuthenticationCompletedAction>(_authenticationCompleted),
]);

UserState _authenticationRequested(UserState state, AuthenticationRequestedAction action) {
  return state.copyWith(email: action.email, password: action.password);
}

UserState _authenticationCompleted(UserState state, AuthenticationCompletedAction action) {
  print('auth completed');
  return state.copyWith(token: action.token);
}
