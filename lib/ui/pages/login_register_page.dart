import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/blocs/authentication_bloc.dart';
import 'package:kapitalist/ui/util.dart';

typedef _Validator = String Function(String val);
typedef OnSubmitCallback = void Function(String email, String password);

enum SignupState {
  LOGIN,
  REGISTER,
}

class LoginRegisterPage extends StatelessWidget {
  final _keyForm = new GlobalKey<FormState>();
  final _keyEmail = new GlobalKey<FormFieldState<String>>();
  final _keyPassword = new GlobalKey<FormFieldState<String>>();

  final SignupState signupState;
  final AuthenticationBloc bloc;

  LoginRegisterPage({
    Key key,
    @required this.signupState,
    @required this.bloc,
  }) : super(key: key ?? null) {
    bloc.loginState.listen((state) {
      if (state) {
        Navigator.pushReplacementNamed(_keyForm.currentContext, KapitalistRoutes.HOME);
      }
    });
  }

  String _validateEmail(String email) {
    return email.contains('@') ? null : 'Invalid email';
  }

  String _validatePassword(String password) {
    return null;
  }

  void _submit() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      if (signupState == SignupState.LOGIN) {
        showSnackbar(_keyForm.currentContext,
          'LOGIN: Email: ${_keyEmail.currentState.value} Password: ${_keyPassword.currentState.value}');

        bloc.login.add(LoginRegisterData(_keyEmail.currentState.value, _keyPassword.currentState.value));
      } else {
        showSnackbar(_keyForm.currentContext,
          'REGISTER: Email: ${_keyEmail.currentState.value} Password: ${_keyPassword.currentState.value}');

        bloc.register.add(LoginRegisterData(_keyEmail.currentState.value, _keyPassword.currentState.value));
      }
    }
  }

  Widget _buildAppIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 75.0,
      ),
    );
  }

  Widget _buildTextField(Key key, String labelText, IconData icon, _Validator fn, {TextInputType inputType, bool obscure}) {
    return TextFormField(
      key: key,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: obscure ?? false,
      validator: fn,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 5.0), child: Icon(icon)),
      ),
    );
  }

  Widget _buildButton(String text) {
    return MaterialButton(
      child: Text(text),
      color: Colors.green,
      minWidth: 250.0,
      onPressed: _submit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
        key: _keyForm,
        child: ListView(
          //padding: const EdgeInsets.symmetric(horizontal: 45.0),
          padding: const EdgeInsets.all(45.0),
          children: <Widget>[
            _buildAppIcon(),
            const SizedBox(height: 40.0),
            _buildTextField(_keyEmail, 'Email', Icons.email, _validateEmail, inputType: TextInputType.emailAddress),
            const SizedBox(height: 15.0),
            _buildTextField(_keyPassword, 'Password', Icons.vpn_key, _validatePassword, obscure: true),
            const SizedBox(height: 40.0),
            _buildButton(signupState == SignupState.LOGIN ? 'Login' : 'Register'),
          ],
        ),
      ),
    );
  }
}
