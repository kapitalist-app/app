import 'package:http/http.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/auth/auth_actions.dart';
import 'package:kapitalist/redux/wallet/wallet_actions.dart';

class WalletMiddleware extends MiddlewareClass<AppState> {

  final Client client;

  WalletMiddleware(this.client);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is AuthSuccessfulAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.apiState.api;
      // XXX: api currently throws
      final resp = await api.listWallets();
      store.dispatch(WalletsFetchedAction(response: resp));
    }
    else if (action is CreateWalletAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.apiState.api;
      // XXX: api currently throws
      final resp = await api.createWallet(action.request);
      store.dispatch(WalletCreatedAction(response: resp));
    }
    next(action);
  }
}
