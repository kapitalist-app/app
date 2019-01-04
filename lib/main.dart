import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/ui/main_page.dart';
import 'package:kapitalist/ui/presentation/login_register_page.dart';

Future<Null> main() async {
  runApp(new KapitalistApp());
}

class KapitalistApp extends StatefulWidget {
  KapitalistApp();

  @override
  _KapitalistAppState createState() => new _KapitalistAppState();
}

class _KapitalistAppState extends State<KapitalistApp> {
  @override
  void initState() {
    super.initState();
    // widget.store.dispatch(new InitAction());
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Kapitalist',
        // TODO: investigate why the keyboard only works when login is home instead of regular route
        home: new LoginRegisterPage(),
        routes: {
          /*KapitalistRoutes.ROOT: (ctx) {
            return new Login();
          },*/
          KapitalistRoutes.HOME: (ctx) {
            return new MainPage();
          },
          KapitalistRoutes.ADD_TRANSACTION: (ctx) {
            return new Container();
          },
        },
    );
  }
}
