import 'package:flutter/material.dart';
import 'package:kapitalist/models/register_login_data.dart';
import 'package:meta/meta.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/blocs/authentication_bloc.dart';
import 'package:kapitalist/ui/util.dart';

enum SignupState {
  LOGIN,
  REGISTER,
}

class RegisterLoginPage extends StatefulWidget {
  final SignupState signupState;
  final AuthenticationBloc bloc;

  RegisterLoginPage({
    Key key,
    @required this.signupState,
    @required this.bloc,
  }) : super(key: key);

  State<RegisterLoginPage> createState() => _RegisterLoginPageState();
}

class _RegisterLoginPageState extends State<RegisterLoginPage> {
  final _keyForm = new GlobalKey<FormState>();
  final _keyEmail = new GlobalKey<FormFieldState<String>>();
  final _keyPassword = new GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();

    widget.bloc.loginState.listen((state) {
      if (state) {
        Navigator.of(_keyForm.currentContext).pushReplacementNamed(KapitalistRoutes.HOME);
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
      final data = RegisterLoginData((b) => b
        ..email = _keyEmail.currentState.value
        ..password = _keyPassword.currentState.value);

      if (widget.signupState == SignupState.LOGIN) {
        Util.showSnackbar(_keyForm.currentContext,
            'LOGIN: Email: ${_keyEmail.currentState.value} Password: ${_keyPassword.currentState.value}');
        widget.bloc.login.add(data);
      } else {
        Util.showSnackbar(_keyForm.currentContext,
            'REGISTER: Email: ${_keyEmail.currentState.value} Password: ${_keyPassword.currentState.value}');
        widget.bloc.register.add(data);
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
            Util.buildTextFormField(_keyEmail, 'Email', Icons.email, _validateEmail,
                inputType: TextInputType.emailAddress),
            const SizedBox(height: 15.0),
            Util.buildTextFormField(
                _keyPassword, 'Password', Icons.vpn_key, _validatePassword,
                obscure: true),
            const SizedBox(height: 40.0),
            _buildButton(
                widget.signupState == SignupState.LOGIN ? 'Login' : 'Register'),
          ],
        ),
      ),
    );
  }
}
