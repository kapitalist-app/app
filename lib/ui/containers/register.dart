import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kapitalist/actions/authentication_actions.dart';
import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/ui/presentation/login_register_page.dart';

class Register extends StatelessWidget {
  Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSubmitCallback>(
      converter: (Store<AppState> store) {
        return (email, password) {
          store.dispatch(RequestRegisterAction(email, password));
        };
      },
      builder: (BuildContext context, OnSubmitCallback onSubmit) {
        return LoginRegisterPage(
          onSubmit: onSubmit,
          signupState: SignupState.REGISTER,
        );
      },
    );
  }
}