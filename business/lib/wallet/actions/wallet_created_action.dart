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
    var wallets = List.of(state.wallet.wallets);
    wallets.add(Wallet.fromResponse(this.response));
    final walletState = WalletState(wallets: List.unmodifiable(wallets));
    return state.copyWith(walletState: walletState);
  }
}