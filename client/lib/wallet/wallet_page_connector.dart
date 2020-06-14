import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:business/business.dart';

import 'package:client/client.dart';

class WalletPageConnector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WalletPageViewModel>(
      model: WalletPageViewModel(),
      builder: (BuildContext ctx, WalletPageViewModel vm) => WalletPage(
        onSubmit: vm.onSubmit,
      ),
    );
  }
}
