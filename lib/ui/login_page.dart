import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: new CircleAvatar(
            backgroundColor: Colors.green,
            radius: 75.0,
          ),
        ),
        new Padding(
          padding: const EdgeInsets.all(40.0),
          child: new TextField(
            decoration: new InputDecoration(
              labelText: 'Email',
              prefixIcon: new Icon(Icons.email),
            ),  
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: new TextField(
            decoration: new InputDecoration(
              labelText: 'Password',
              prefixIcon: new Icon(Icons.vpn_key),
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: new MaterialButton(
            child: new Text('Login'),
            color: Colors.green,
            minWidth: 250.0,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
