import 'package:flutter/material.dart';

import 'package:kapitalist/ui/widgets/card_title.dart';

class LastRecordsCard extends StatelessWidget {
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
              title: 'Last records',
              onPressed: () {},
            ),
            new ListView(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.monetization_on),
                  title: new Text('some record'),
                ),
                new ListTile(
                  leading: new Icon(Icons.monetization_on),
                  title: new Text('some record'),
                ),
                new ListTile(
                  leading: new Icon(Icons.monetization_on),
                  title: new Text('some record'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}