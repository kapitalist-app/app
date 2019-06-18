import 'package:meta/meta.dart';

import 'package:kapitalist/models/transaction.dart';

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
