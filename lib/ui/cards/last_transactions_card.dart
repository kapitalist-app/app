import 'package:flutter/material.dart';

import 'package:business/business.dart';

import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/ui/cards/kapitalist_card.dart';
import 'package:kapitalist/util.dart';

class LastTransactionsCard extends StatelessWidget {
  final List<Wallet> wallets;
  final List<Category> categories;
  final List<Transaction> transactions;

  const LastTransactionsCard(
      {Key key, this.wallets, this.categories, this.transactions})
      : super(key: key);

  bool _isFromActiveWallet(Transaction t, List<Wallet> wallets) =>
      wallets.map((w) => w.id).contains(t.walletId);

  Widget _buildTransactionTile(Transaction t, List<Category> categories) {
    var cat = categories.singleWhere((c) => c.id == t.categoryId);
    var local = t.timestamp.toLocal();
    return ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text('${t.name}'),
      subtitle: Text('${cat.name}'),
      trailing: Column(
        children: <Widget>[
          Text('${t.amount}€'),
          Text(
              '${Util.pad2Zeroes(local.day)}.${Util.pad2Zeroes(local.month)}.${local.year}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = this.categories;
    final tx = this
        .transactions
        .where((t) => _isFromActiveWallet(t, this.wallets))
        .toList();
    tx.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    // XXX: Pass categories here once we actually fetch them
    final children = tx.reversed
        .take(5)
        .map((t) => _buildTransactionTile(t, categories))
        .toList();
    children.add(Text('Footer'));

    return new KapitalistCard(
      title: CardTitle(
        title: 'Last transactions',
        onPressed: () {},
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
