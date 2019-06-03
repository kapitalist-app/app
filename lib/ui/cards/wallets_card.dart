import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/models/wallet_response.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/ui/cards/card_title.dart';

class WalletsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: StoreConnector<AppState, List<WalletResponse>>(
          converter: (store) => store.state.walletState.wallets,
          builder: (ctx, wallets) {
            Column(
              children: <Widget>[
                CardTitle(title: 'Wallets'),
                for (var w in wallets) _buildWalletElement(w),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildWalletElement(WalletResponse wallet) {
    return Text(wallet.name);
  }
}
