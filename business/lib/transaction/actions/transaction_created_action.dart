import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/transaction/models/transaction.dart';
import 'package:business/transaction/models/transaction_response.dart';

class TransactionCreatedAction extends ReduxAction<AppState> {
  TransactionCreatedAction(this.response);

  final TransactionResponse response;

  @override
  AppState reduce() {
    return state.rebuild((b) => b
      ..transaction.update(
          (b) => b..transactions.add(Transaction.fromResponse(this.response))));
  }
}
