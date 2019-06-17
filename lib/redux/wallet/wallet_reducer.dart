import 'package:kapitalist/models/wallet.dart';
import 'package:kapitalist/redux/wallet/wallet_actions.dart';
import 'package:kapitalist/redux/wallet/wallet_state.dart';

WalletState walletReducer(WalletState state, dynamic action) {
  if (action is WalletCreatedAction) {
    var wallets = List.of(state.wallets);
    wallets.add(Wallet.fromResponse(action.response));
    return WalletState(wallets: List.unmodifiable(wallets));
  }
  // TODO: implement fully

  return state;
}
