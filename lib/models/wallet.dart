import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/wallet_response.dart';

class Wallet {

  // From WalletResponse
  final int id;
  final String name;
  final String walletType;
  final int balance;
  final String color;
  final String createdAt;

  // App related XXX: Check if this is how we want to store this state
  final bool selected;

  const Wallet({
    @required this.id,
    @required this.name,
    @required this.walletType,
    @required this.balance,
    @required this.color,
    @required this.createdAt,
    @required this.selected,
  });

  factory Wallet.fromResponse(WalletResponse resp) => Wallet(
    id: resp.id,
    name: resp.name,
    walletType: resp.walletType,
    balance: resp.balance,
    color: resp.color,
    createdAt: resp.createdAt,
    selected: true,
  );
}
