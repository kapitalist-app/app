import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:kapitalist/redux/common/common_actions.dart';
import 'package:key_value_store_flutter/key_value_store_flutter.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kapitalist/keys.dart';
import 'package:kapitalist/routes.dart';
import 'package:kapitalist/redux/store.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/ui/main_page.dart';
import 'package:kapitalist/ui/pages/onboarding_page.dart';
import 'package:kapitalist/ui/pages/transaction_page.dart';
import 'package:kapitalist/ui/pages/wallet_page.dart';

Future<void> main() async {
  final prefs = await SharedPreferences.getInstance();
  final kvStore = FlutterKeyValueStore(prefs);
  var store = createStore(Client(), kvStore);

  store.dispatch(InitAction());

  runApp(KapitalistApp(store));
}

class KapitalistApp extends StatefulWidget {
  final Store<AppState> store;

  KapitalistApp(this.store);

  @override
  _KapitalistAppState createState() => _KapitalistAppState();
}

class _KapitalistAppState extends State<KapitalistApp> {
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          title: 'Kapitalist',
          routes: {
            // TODO: investigate why the keyboard only works when login is home instead of regular route
            KapitalistRoutes.ROOT: (ctx) {
              print(
                  '#### Building page for ${KapitalistRoutes.ONBOARDING} ####');
              return new OnboardingPage();
            },
            KapitalistRoutes.HOME: (ctx) {
              print('#### Building page for ${KapitalistRoutes.HOME} ####');
              return new MainPage();
            },
            KapitalistRoutes.NEW_WALLET: (ctx) {
              print(
                  '#### Building page for ${KapitalistRoutes.NEW_WALLET} ####');
              return new WalletPage();
            },
            KapitalistRoutes.NEW_TRANSACTION: (ctx) {
              print(
                  '#### Building page for ${KapitalistRoutes.NEW_TRANSACTION} ####');
              return new TransactionPage();
            },
          },
        ));
  }
}
