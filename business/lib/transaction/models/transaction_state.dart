import 'package:meta/meta.dart';

import 'package:business/transaction/models/transaction.dart';

class TransactionState {
  final List<Transaction> transactions;

  const TransactionState({
    @required this.transactions,
  });

  factory TransactionState.initial() {
    return TransactionState(
      transactions: const <Transaction>[],
    );
  }
}
