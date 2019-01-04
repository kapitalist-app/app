import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapitalist/ui/containers/login.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/store.dart';
import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/ui/main_page.dart';

Future<Null> main() async {
  var store = await createStore();
  runApp(new KapitalistApp(store));
}

class KapitalistApp extends StatefulWidget {
  final Store<AppState> store;
  KapitalistApp(this.store);

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
    return new StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Kapitalist',
        // TODO: investigate why the keyboard only works when login is home instead of regular route
        home: new Login(),
        routes: {
          /*KapitalistRoutes.ROOT: (ctx) {
            return new Login();
          },*/
          KapitalistRoutes.HOME: (ctx) {
            return new MainPage(widget.store);
          },
          KapitalistRoutes.ADD_TRANSACTION: (ctx) {
            return new Container();
          },
        },
      ),
    );
  }
}
