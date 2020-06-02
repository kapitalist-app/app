import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/transaction/models/transaction.dart';
import 'package:business/transaction/models/transaction_response.dart';
import 'package:business/transaction/models/transaction_state.dart';

class TransactionCreatedAction extends ReduxAction<AppState> {
  final TransactionResponse response;

  TransactionCreatedAction({@required this.response});

  @override
  AppState reduce() {
    var txs = List.of(state.transaction.transactions);
    txs.add(Transaction.fromResponse(this.response));
    final txState = TransactionState(transactions: List.unmodifiable(txs));
    return state.copyWith(transactionState: txState);
  }
}
