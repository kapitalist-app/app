import 'package:http/http.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/redux/app/app_reducer.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/api/api_middleware.dart';
import 'package:kapitalist/redux/auth/auth_middleware.dart';
import 'package:kapitalist/redux/common/common_middleware.dart';
import 'package:kapitalist/redux/wallet/wallet_middleware.dart';

Store<AppState> createStore(Client client, KeyValueStore kv) {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      ApiMiddleware(kv),
      CommonMiddleware(kv),
      AuthMiddleware(client, kv),
      WalletMiddleware(client),
    ]
  );
}
