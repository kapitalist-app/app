import 'package:flutter/material.dart';

// TODO: Make page scroll up when keyboard is extended

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = new GlobalKey<FormState>();

  String _email;
  String _password;

  String _validateEmail(String email) {
    return email.contains('@') ? null : 'Invalid email';
  }

  String _validatePassword(String password) {
    return null;
  }

  void _submit() {
    if (_keyForm.currentState.validate()) {
      // TODO: do register/login
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _keyForm,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 75.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.email)),
              ),
              validator: (val) => _validateEmail(val),
              onSaved: (val) => _email = val,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.vpn_key),
                ),
              ),
              validator: (val) => _validatePassword(val),
              onSaved: (val) => _password = val,
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
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
