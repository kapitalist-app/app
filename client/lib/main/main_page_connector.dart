import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:business/business.dart';

import 'package:client/main/main_page.dart';
import 'package:client/main/main_page_viewmodel.dart';

class MainPageConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageViewModel>(
      model: MainPageViewModel(),
      builder: (BuildContext ctx, MainPageViewModel vm) => MainPage(
        onCreateTransaction: vm.onCreateTransaction,
      ),
    );
  }

}