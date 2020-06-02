import 'dart:async';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/transaction/models/transaction_creation_request.dart';

class CreateTransactionAction extends ReduxAction<AppState> {
  final TransactionCreationRequest request;

  CreateTransactionAction({@required this.request});

  @override
  FutureOr<AppState> reduce() {
    // TODO: implement reduce
    throw UnimplementedError();
  }
}