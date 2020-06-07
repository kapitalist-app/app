import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/api/transaction_api.dart';
import 'package:business/transaction/actions/transactions_fetched_action.dart';
import 'package:business/transaction/models/transaction_response.dart';

class FetchTransactionsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final baseUrl = state.baseUrl;
    final api = TransactionApi(baseUrl);

    final resps = <TransactionResponse>[];
    for (var wallet in state.wallet.wallets) {
      resps.addAll(await api.getTransactions(wallet.id, state.auth.token));
    }
    store.dispatch(TransactionsFetchedAction(resps));

    return null;
  }
}
