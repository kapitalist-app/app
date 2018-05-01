import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/models/models.dart';
import 'package:kapitalist/redux/reducers/app_state_reducer.dart';
import 'package:kapitalist/ui/main_page.dart';

void main() => runApp(new KapitalistApp());

class KapitalistApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: new AppState(),
    // middleware: createMiddleware(),
  );

  KapitalistApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
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
