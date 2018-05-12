import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:kapitalist/models/common/signup_state.dart';
import 'package:kapitalist/routes.dart';
import 'package:kapitalist/ui/util.dart';

typedef _Validator = String Function(String val);
typedef OnSubmitCallback = void Function(String email, String password);

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
      showSnackbar(_keyForm.currentContext,
          'LOGIN/REGISTER: Email: ${_keyEmail.currentState.value} Password: ${_keyPassword.currentState.value}');

      onSubmit(_keyEmail.currentState.value, _keyPassword.currentState.value);

      // TODO: This is temporary and should fire on login complete
      Navigator.pushReplacementNamed(_keyForm.currentContext, KapitalistRoutes.HOME);
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
