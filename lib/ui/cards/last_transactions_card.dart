import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/models/transaction.dart';
import 'package:kapitalist/models/wallet.dart';
import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/ui/cards/kapitalist_card.dart';
import 'package:kapitalist/util.dart';

class LastTransactionsCard extends StatelessWidget {
  bool _isFromActiveWallet(Transaction t, List<Wallet> wallets) =>
      wallets.map((w) => w.id).contains(t.walletId);

  Widget _buildTransactionTile(Transaction t) {
    var local = t.timestamp.toLocal();
    return ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text('${t.name}'),
      subtitle: Text('${t.categoryId}'),
      trailing: Column(
        children: <Widget>[
          Text('${t.amount}€'),
          Text('${Util.pad2Zeroes(local.day)}.${Util.pad2Zeroes(local.month)}.${local.year}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new KapitalistCard(
      title: CardTitle(
        title: 'Last transactions',
        onPressed: () {},
      ),
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (ctx, state) {
          final tx = state.transactionState.transactions
              .where((t) => _isFromActiveWallet(t, state.walletState.wallets))
              .toList();
          tx.sort((a, b) => a.timestamp.compareTo(b.timestamp));

          // XXX: Pass categories here once we actually fetch them
          final children = tx.reversed.take(5).map(_buildTransactionTile).toList();
          children.add(Text('Footer'));

          return Column(
            children: children,
          );
        },
      ),
    );
  }
}
