import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:kapitalist/ui/util.dart';

// TODO: Make page scroll up when keyboard is extended

enum SignupState {
  LOGIN,
  REGISTER,
}

typedef OnSubmitCallback = Function(String email, String password);

class LoginRegisterPage extends StatelessWidget {
  final _keyForm = new GlobalKey<FormState>();
  final _keyEmail = new GlobalKey<FormFieldState<String>>();
  final _keyPassword = new GlobalKey<FormFieldState<String>>();

  final OnSubmitCallback onSubmit;
  final SignupState signupState;

  LoginRegisterPage({
    Key key,
    @required this.onSubmit,
    @required this.signupState,
  }) : super(key: key ?? null);

  String _validateEmail(String email) {
    return email.contains('@') ? null : 'Invalid email';
  }

  String _validatePassword(String password) {
    return null;
  }

  void _submit() {
    final form = _keyForm.currentState;

    if (form.validate()) {
      showSnackbar(_keyForm.currentContext, 'LOGIN/REGISTER: Email: $_keyEmail.currentState.value Password: $_keyPassword.currentState.value');

      onSubmit(_keyEmail.currentState.value, _keyPassword.currentState.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _keyForm,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 75.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              key: _keyEmail,
              validator: (val) => _validateEmail(val),
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.email)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              key: _keyPassword,
              validator: (val) => _validatePassword(val),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.vpn_key),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            child: MaterialButton(
              child: Text('Login'),
              color: Colors.green,
              minWidth: 250.0,
              onPressed: _submit,
            ),
          )
        ],
      ),
    );
  }
}
