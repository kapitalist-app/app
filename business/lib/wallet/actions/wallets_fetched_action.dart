import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:business/app_state.dart';
import 'package:business/wallet/models/wallet.dart';
import 'package:business/wallet/models/wallet_response.dart';

class WalletsFetchedAction extends ReduxAction<AppState> {
  final List<WalletResponse> response;

  WalletsFetchedAction(this.response);

  @override
  AppState reduce() {
    final wallets = this.response.map((w) => Wallet.fromResponse(w)).toBuiltList();
    return state.rebuild((b) => b
      ..wallet.update((b) => b
        ..wallets = wallets.toBuilder()
      ));
  }
}
