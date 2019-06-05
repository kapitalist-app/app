import 'package:meta/meta.dart';

import 'package:kapitalist/models/wallet.dart';

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
