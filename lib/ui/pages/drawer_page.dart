import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  Widget _buildHeader(String email) {
    return new Stack(
      children: <Widget>[
        Container(
          color: Colors.greenAccent,
          height: 130.0,
          width: double.infinity,
        ),
        Positioned(
          left: 25.0,
          bottom: 20.0,
          child: CircleAvatar(
            backgroundColor: Colors.yellowAccent,
            radius: 35.0,
            child: FlutterLogo(),
          ),
        ),
        Positioned(
          left: 120.0,
          bottom: 40.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Kapitalist',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(email),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationItems() {
    return new Column(
      children: <Widget>[
        Text('Reports etc..'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildHeader('email@example.com'),
        _buildNavigationItems(),
      ],
    );
  }
}
