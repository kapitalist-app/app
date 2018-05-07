import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/store.dart';
import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/reducers/app_state_reducer.dart';
import 'package:kapitalist/ui/main_page.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

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
        routes: {
          KapitalistRoutes.HOME: (ctx) {
            return new StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(null),
              builder: (ctx, store) {
                return MainPage();
              },
            );
          },
          KapitalistRoutes.ADD_TRANSACTION: (ctx) {
            return new StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(null),
              builder: (ctx, store) {
                // TODO: Implement
                return Container();
              },
            );
          },
        },
      ),
    );
  }
}
