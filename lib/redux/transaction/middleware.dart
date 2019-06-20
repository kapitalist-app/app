import 'package:http/http.dart';
import 'package:kapitalist/models/api/transaction_response.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/wallet/actions.dart';
import 'package:kapitalist/redux/transaction/actions.dart';

class TransactionMiddleware extends MiddlewareClass<AppState> {

  final Client client;

  TransactionMiddleware(this.client);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is WalletsFetchedAction || action is RefreshTransactionsAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.apiState.api;
      // XXX: api currently throws
      final resps = <TransactionResponse>[];
      for (var wallet in store.state.walletState.wallets) {
        resps.addAll(await api.getTransactions(wallet.id));
      }
      store.dispatch(TransactionsUpdatedAction(response: resps));
    }
    else if (action is CreateTransactionAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.apiState.api;
      // XXX: api currently throws
      print('${action.request.toString()}');
      final resp = await api.createTransaction(action.request);
      store.dispatch(TransactionCreatedAction(response: resp));
    }
    next(action);
  }
}
