import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/transaction/models/transaction.dart';
import 'package:business/transaction/models/transaction_response.dart';
import 'package:business/transaction/models/transaction_state.dart';

class TransactionsFetchedAction extends ReduxAction<AppState> {
  final List<TransactionResponse> response;

  TransactionsFetchedAction({@required this.response});

  @override
  AppState reduce() {
    final txs = this.response.map((t) => Transaction.fromResponse(t));
    final txState = TransactionState(transactions: List.unmodifiable(txs));
    return state.copyWith(transactionState: txState);
  }
}