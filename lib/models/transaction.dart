import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/transaction_response.dart';

class Transaction {
  // From TransactionResponse
  final int id;
  final int walletId;
  final int categoryId;
  final String name;
  final int amount;
  final DateTime timestamp;

  // App related XXX: Check if this is how we want to store this state

  const Transaction({
    @required this.id,
    @required this.walletId,
    @required this.categoryId,
    @required this.name,
    @required this.amount,
    @required this.timestamp,
  });

  factory Transaction.fromResponse(TransactionResponse resp) => Transaction(
    id: resp.id,
    walletId: resp.walletId,
    categoryId: resp.categoryId,
    name: resp.name,
    amount: resp.amount,
    timestamp: resp.timestamp,
  );
}
