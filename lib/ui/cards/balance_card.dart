import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/ui/cards/kapitalist_card.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new KapitalistCard(
      title: CardTitle(
        title: 'Balance',
        onPressed: () {},
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              '3000,00€',
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
          ),
          Text(
            '+1,5%',
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.green,
            ),
          ),
          Text(
            'vs last month',
            style: const TextStyle(
              fontSize: 10.0,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
