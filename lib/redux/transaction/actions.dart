import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/transaction_creation_request.dart';
import 'package:kapitalist/models/api/transaction_response.dart';

class CreateTransactionAction {
  final TransactionCreationRequest request;

  CreateTransactionAction({@required this.request});
}

class TransactionCreatedAction {
  final TransactionResponse response;

  TransactionCreatedAction({@required this.response});
}

class RefreshTransactionsAction {}

class TransactionsUpdatedAction {
  final List<TransactionResponse> response;

  TransactionsUpdatedAction({@required this.response});
}