import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/transaction/models/transaction.dart';
import 'package:business/transaction/models/transaction_response.dart';
import 'package:business/transaction/models/transaction_state.dart';

class TransactionsFetchedAction extends ReduxAction<AppState> {
  TransactionsFetchedAction(this.responses);

  final List<TransactionResponse> responses;

  @override
  AppState reduce() {
    final txs = this.responses.map((t) => Transaction.fromResponse(t));
    final txState = TransactionState(transactions: List.unmodifiable(txs));
    return state.copyWith(transactionState: txState);
  }
}