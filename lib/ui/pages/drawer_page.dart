import 'package:flutter/material.dart';

import 'package:kapitalist/blocs/authentication_bloc.dart';
import 'package:kapitalist/routes.dart';

class DrawerPage extends StatelessWidget {
  final AuthenticationBloc bloc;

  DrawerPage({@required this.bloc});

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

  Widget _buildNavigationItems(BuildContext ctx) {
    return new Column(
      children: <Widget>[
        MaterialButton(
          child: Text('Create wallet'),
          onPressed: () {
            Navigator.of(ctx).pushNamed(KapitalistRoutes.NEW_WALLET);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return new Column(
      children: <Widget>[
        // XXX: Read and refresh this from bloc
        _buildHeader('user@example.com'),
        _buildNavigationItems(ctx),
      ],
    );
  }
}
