import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/cards.dart';

class AccountTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        WalletsCard(),
        BalanceCard(),
        //BalanceChartCard(),
        LastTransactionsCard(),
        Column(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.widgets,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                // TODO:
              },
            ),
            Text('ADD WIDGET'),
          ],
        )
      ],
    );
  }
}
