import 'dart:async';

import 'package:redux/redux.dart';

import 'package:kapitalist/actions/authentication_actions.dart';
import 'package:kapitalist/actions/common_actions.dart';
import 'package:kapitalist/api/kapitalist_api.dart';
import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/models/common/signup_state.dart';

class AuthenticationMiddleware extends MiddlewareClass<AppState> {
  final KapitalistApi api;

  AuthenticationMiddleware(this.api);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    switch (action.runtimeType) {
      case InitAction:
        print('init');
        break;
      case AuthenticationRequestedAction:
        if (action.signupState == SignupState.LOGIN) {
          print('[AuthenticationRequestedAction] AuthenticationRequestedAction (login)');
          // TODO: call api.login(..)
        } else {
          print('[AuthenticationRequestedAction] AuthenticationRequestedAction (register)');
          var token = await api.register(action.email, action.password);
          next(new AuthenticationCompletedAction(token));
        }
        break;
      default:
        break;
    }
  }
}
