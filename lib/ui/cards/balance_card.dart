import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/card_title.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Column(
          children: <Widget>[
            CardTitle(
              title: 'Balance',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
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
      ),
    );
  }
}
