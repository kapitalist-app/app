import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/wallet/models/wallet.dart';
import 'package:business/wallet/models/wallet_response.dart';
import 'package:business/wallet/models/wallet_state.dart';

class WalletsFetchedAction extends ReduxAction<AppState> {
  final List<WalletResponse> response;

  WalletsFetchedAction({@required this.response});

  @override
  AppState reduce() {
    final wallets = this.response.map((w) => Wallet.fromResponse(w));
    final walletState = WalletState(wallets: List.unmodifiable(wallets));
    return state.copyWith(walletState: walletState);
  }
}
