import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:business/business.dart';
import 'package:business/routes.dart';

import 'package:kapitalist/persistor.dart';
import 'package:kapitalist/ui/main_page.dart';

import 'package:client/client.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // FIXME: figure out, if we need this here
  WidgetsFlutterBinding.ensureInitialized();

  // Build store
  var store = Store(
    initialState: AppState.initial(),
    persistor: KapitalistPersistor(),
  );

  // Wire up navigator key
  NavigateAction.setNavigatorKey(navigatorKey);

  store.dispatch(InitAction());
  runApp(KapitalistApp(store, navigatorKey));
}

class KapitalistApp extends StatefulWidget {
  final Store<AppState> store;
  final GlobalKey<NavigatorState> navKey;

  KapitalistApp(this.store, this.navKey);

  @override
  _KapitalistAppState createState() => _KapitalistAppState();
}

class _KapitalistAppState extends State<KapitalistApp> {
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          title: 'Kapitalist',
          navigatorKey: widget.navKey,
          routes: {
            // TODO: investigate why the keyboard only works when login is home instead of regular route
            KapitalistRoutes.ROOT: (ctx) {
              debugPrint(
                  '#### Building page for ${KapitalistRoutes.ONBOARDING} ####');
              return new OnboardingPageConnector();
            },
            KapitalistRoutes.HOME: (ctx) {
              debugPrint('#### Building page for ${KapitalistRoutes.HOME} ####');
              return new MainPage();
            },
            KapitalistRoutes.NEW_WALLET: (ctx) {
              debugPrint(
                  '#### Building page for ${KapitalistRoutes.NEW_WALLET} ####');
              return new WalletPage();
            },
            KapitalistRoutes.NEW_TRANSACTION: (ctx) {
              debugPrint(
                  '#### Building page for ${KapitalistRoutes.NEW_TRANSACTION} ####');
              return new TransactionPage();
            },
          },
        ));
  }
}
