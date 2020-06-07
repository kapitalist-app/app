import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:kapitalist/routes.dart';

class DrawerPage extends StatelessWidget {
  final String email;
  final VoidCallback onRefreshTransactions;

  const DrawerPage(
      {Key key, @required this.email, @required this.onRefreshTransactions})
      : super(key: key);

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
              Text(email)
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
        MaterialButton(
          child: Text('Create transaction'),
          onPressed: () {
            Navigator.of(ctx).pushNamed(KapitalistRoutes.NEW_TRANSACTION);
          },
        ),
        MaterialButton(
          child: Text('Refresh'),
          onPressed: this.onRefreshTransactions,
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
