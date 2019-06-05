import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/models/wallet.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/util.dart';

class WalletsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: StoreConnector<AppState, List<Wallet>>(
          converter: (store) => store.state.walletState.wallets,
          builder: (ctx, wallets) {
            Row(
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

  Widget _buildWalletElement(Wallet wallet) {
    return SizedBox.fromSize(
      size: Size.fromWidth(30),
      child: Container(
        color: Util.parseHexColor(wallet.color),
        child: Row(
          children: [
            Text(wallet.name),
            Text(wallet.balance.toString()),
          ],
        ),
      ),
    );
  }
}
