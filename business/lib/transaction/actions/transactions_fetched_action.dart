import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:business/app_state.dart';
import 'package:business/transaction/models/transaction.dart';
import 'package:business/transaction/models/transaction_response.dart';

class TransactionsFetchedAction extends ReduxAction<AppState> {
  TransactionsFetchedAction(this.responses);

  final List<TransactionResponse> responses;

  @override
  AppState reduce() {
    final txs = this.responses
        .map((t) => Transaction.fromResponse(t))
        .toBuiltList();
    return state.rebuild((b) => b
      ..transaction.update((b) => b
        ..transactions = txs.toBuilder()));
  }
}