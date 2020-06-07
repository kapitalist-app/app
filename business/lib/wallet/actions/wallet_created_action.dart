import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/wallet/models/wallet.dart';
import 'package:business/wallet/models/wallet_response.dart';
import 'package:business/wallet/models/wallet_state.dart';

class WalletCreatedAction extends ReduxAction<AppState> {
  final WalletResponse response;

  WalletCreatedAction({@required this.response});

  @override
  AppState reduce() {
    return state.rebuild((b) => b
      ..wallet.update((b) => b
        ..wallets.add(Wallet.fromResponse(this.response))
    ));
  }
}
