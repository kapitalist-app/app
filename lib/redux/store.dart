import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:kapitalist/redux/reducer.dart';

import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/api/middleware.dart';
import 'package:kapitalist/redux/auth/middleware.dart';
import 'package:kapitalist/redux/category/middleware.dart';
import 'package:kapitalist/redux/common/middleware.dart';
import 'package:kapitalist/redux/transaction/middleware.dart';
import 'package:kapitalist/redux/wallet/middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';

Store<AppState> createStore(Client client, SharedPreferences prefs) {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      ApiMiddleware(prefs),
      AuthMiddleware(client, prefs),
      CategoryMiddleware(client),
      CommonMiddleware(prefs),
      TransactionMiddleware(client),
      WalletMiddleware(client),
    ]
  );
}
