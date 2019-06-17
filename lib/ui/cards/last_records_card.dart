import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/ui/cards/kapitalist_card.dart';

class LastRecordsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new KapitalistCard(
      title: CardTitle(
        title: 'Last records',
        onPressed: () {},
      ),
      child: Column(
        children: <Widget>[
          SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: Text('some record'),
                  subtitle: Text('Category\n"Description"'),
                  trailing: Column(
                    children: <Widget>[
                      Text('-200,0€'),
                      Text('24.04.18'),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: Text('some record'),
                  subtitle: Text('Category\n"Description"'),
                  trailing: Column(
                    children: <Widget>[
                      Text('-200,0€'),
                      Text('24.04.18'),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: Text('some record'),
                  subtitle: Text('Category\n"Description"'),
                  trailing: Column(
                    children: <Widget>[
                      Text('-200,0€'),
                      Text('24.04.18'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text('Footer'),
        ],
      ),
    );
  }
}
