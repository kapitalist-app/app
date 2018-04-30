import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
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
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),  
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.vpn_key),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: MaterialButton(
            child: Text('Login'),
            color: Colors.green,
            minWidth: 250.0,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
