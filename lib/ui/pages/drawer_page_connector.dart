import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:business/app_state.dart';

import 'package:kapitalist/ui/pages/drawer_page.dart';
import 'package:kapitalist/ui/pages/drawer_viewmodel.dart';

class DrawerPageConnector extends StatelessWidget {
  DrawerPageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DrawerViewModel>(
        model: DrawerViewModel(),
        builder: (BuildContext ctx, DrawerViewModel vm) => DrawerPage(
              email: vm.email,
              onRefreshTransactions: vm.onRefreshTransactions,
            ));
  }
}
