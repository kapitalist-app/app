import 'package:kapitalist/models/transaction.dart';
import 'package:kapitalist/redux/transaction/actions.dart';
import 'package:kapitalist/redux/transaction/state.dart';

TransactionState transactionReducer(TransactionState state, dynamic action) {
  if (action is TransactionsFetchedAction) {
    var txs = action.response.map((t) => Transaction.fromResponse(t));
    return TransactionState(transactions: List.unmodifiable(txs));
  }
  if (action is TransactionCreatedAction) {
    var transactions = List.of(state.transactions);
    transactions.add(Transaction.fromResponse(action.response));
    return TransactionState(transactions: List.unmodifiable(transactions));
  }
  // TODO: implement fully

  return state;
}
