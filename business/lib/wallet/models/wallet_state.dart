import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:business/wallet/models/wallet.dart';

part 'wallet_state.g.dart';

abstract class WalletState implements Built<WalletState, WalletStateBuilder> {
  // Fields
  BuiltList<Wallet> get wallets;

  // Constructors
  WalletState._();

  factory WalletState([updates(WalletStateBuilder b)]) = _$WalletState;

  static WalletState initial() =>
      WalletState((b) => b..wallets = <Wallet>[].build().toBuilder());
}
