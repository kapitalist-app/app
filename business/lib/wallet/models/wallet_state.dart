import 'package:meta/meta.dart';

import 'package:business/wallet/models/wallet.dart';

class WalletState {
  final List<Wallet> wallets;

  const WalletState({
    @required this.wallets,
  });

  factory WalletState.initial() {
    return WalletState(
      wallets: const <Wallet>[],
    );
  }
}