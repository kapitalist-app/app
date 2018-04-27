import 'package:flutter/material.dart';

import 'package:kapitalist/ui/widgets/card_title.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: EdgeInsets.only(
          bottom: 10.0,
        ),
        child: new Column(
          children: <Widget>[
            new CardTitle(
              title: 'Balance',
              onPressed: () {},
            ),
            new Padding(
              padding: new EdgeInsets.symmetric(vertical: 2.0),
              child: new Text(
                '3000,00€',
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
            ),
            new Text(
              '+1,5%',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.green,
              ),
            ),
            new Text(
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
