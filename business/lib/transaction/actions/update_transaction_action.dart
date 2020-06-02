import 'dart:async';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
//import 'package:business/transaction/models/transaction_update_request.dart';

class UpdateTransactionAction extends ReduxAction<AppState> {
  //final TransactionUpdateRequest request;

  //UpdateTransactionAction({@required this.request});

  @override
  FutureOr<AppState> reduce() {
    // TODO: implement reduce
    throw UnimplementedError();
  }
}