import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:kapitalist/redux/state.dart';
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

class RefreshTransactionsAction extends ReduxAction<AppState> {
  @override
  FutureOr<AppState> reduce() {
    return null;
  }
}

class TransactionsFetchedAction {
  final List<TransactionResponse> response;

  TransactionsFetchedAction({@required this.response});
}