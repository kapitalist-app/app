import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:business/transaction/models/transaction.dart';

part 'transaction_state.g.dart';

abstract class TransactionState implements Built<TransactionState, TransactionStateBuilder>{
  // Fields
  BuiltList<Transaction> get transactions;

  // Constructors
  TransactionState._();

  factory TransactionState([updates(TransactionStateBuilder b)]) = _$TransactionState;

  // Initial state
  static TransactionState initial() {
    return TransactionState((b) => b
      ..transactions = [].build().toBuilder()
    );
  }
}
