import 'package:flutter/material.dart';

import 'package:business/business.dart';

import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/ui/cards/kapitalist_card.dart';
import 'package:kapitalist/ui/util.dart';
import 'package:business/util.dart';

class WalletsCard extends StatelessWidget {
  final List<Wallet> wallets;

  const WalletsCard({Key key, this.wallets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new KapitalistCard(
      title: CardTitle(title: 'Wallets'),
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: [
          for (var w in this.wallets) _buildWalletElement(w),
          Container(
            height: 35,
            width: 100,
            decoration: UiUtil.simpleBorder(width: 1.5),
            child: Center(child: Text('Add wallet')),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletElement(Wallet wallet) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Util.parseHexColor(wallet.color), width: 1.5)),
      //color: Util.parseHexColor(wallet.color),
      width: 100,
      child: Column(
        children: [
          Text(wallet.name),
          Container(width: 10),
          Text('${wallet.balance.toString()}€'),
        ],
      ),
    );
  }
}
