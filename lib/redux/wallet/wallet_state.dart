import 'package:meta/meta.dart';

import 'package:kapitalist/models/wallet_response.dart';

class WalletState {
  const WalletState({
    @required this.wallets,
  });

  final List<WalletResponse> wallets;

  factory WalletState.initial() {
    return WalletState(
      wallets: const <WalletResponse>[],
    );
  }
}
