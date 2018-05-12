import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/actions/authentication_actions.dart';
import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/models/common/signup_state.dart';
import 'package:kapitalist/ui/presentation/login_register_page.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSubmitCallback>(
      converter: (Store<AppState> store) {
        return (email, password) {
          store.dispatch(AuthenticationRequestedAction(SignupState.LOGIN, email, password));
        };
      },
      builder: (BuildContext context, OnSubmitCallback onSubmit) {
        return LoginRegisterPage(
          onSubmit: onSubmit,
          signupState: SignupState.LOGIN,
        );
      },
    );
  }
}