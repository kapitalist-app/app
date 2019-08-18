import 'package:http/http.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';
import 'package:kapitalist/redux/reducer.dart';

import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/api/middleware.dart';
import 'package:kapitalist/redux/auth/middleware.dart';
import 'package:kapitalist/redux/category/middleware.dart';
import 'package:kapitalist/redux/common/middleware.dart';
import 'package:kapitalist/redux/transaction/middleware.dart';
import 'package:kapitalist/redux/wallet/middleware.dart';

Store<AppState> createStore(Client client, KeyValueStore kv) {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      ApiMiddleware(kv),
      AuthMiddleware(client, kv),
      CategoryMiddleware(client),
      CommonMiddleware(kv),
      TransactionMiddleware(client),
      WalletMiddleware(client),
    ]
  );
}
