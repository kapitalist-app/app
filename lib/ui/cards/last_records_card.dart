import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/card_title.dart';

class LastRecordsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Column(
          children: <Widget>[
            CardTitle(
              title: 'Last records',
              onPressed: () {},
            ),
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
      ),
    );
  }
}
