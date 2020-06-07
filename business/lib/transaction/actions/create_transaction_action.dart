import 'dart:async';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/api/transaction_api.dart';
import 'package:business/transaction/actions/transaction_created_action.dart';
import 'package:business/transaction/models/transaction_creation_request.dart';

class CreateTransactionAction extends ReduxAction<AppState> {
  final TransactionCreationRequest request;

  CreateTransactionAction(this.request);

  @override
  Future<AppState> reduce() async {
    final baseUrl = state.baseUrl;
    final api = TransactionApi(baseUrl);

    final resp = await api.createTransaction(this.request, state.auth.token);
    if (resp != null) {
      dispatch(TransactionCreatedAction(resp));
    }

    return null;
  }
}