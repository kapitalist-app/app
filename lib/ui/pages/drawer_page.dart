import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/routes.dart';

class DrawerPage extends StatelessWidget {

  const DrawerPage();

  Widget _buildHeader() {
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
              StoreConnector<AppState, String>(
                converter: (store) => store.state.authState.email,
                builder: (BuildContext ctx, String email) => Text(email),
              ),
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
        _buildHeader(),
        _buildNavigationItems(ctx),
      ],
    );
  }
}
