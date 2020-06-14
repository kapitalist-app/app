import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

import 'package:business/business.dart';

class DrawerViewModel extends BaseModel<AppState> {
  DrawerViewModel();

  String email;
  VoidCallback onRefreshTransactions;

  DrawerViewModel.build({
    @required this.email,
    @required this.onRefreshTransactions,
  }) : super(equals: [email]);

  @override
  DrawerViewModel fromStore() => DrawerViewModel.build(
      email: state.auth.data.email,
      onRefreshTransactions: () => dispatch(FetchTransactionsAction()),
    );

}