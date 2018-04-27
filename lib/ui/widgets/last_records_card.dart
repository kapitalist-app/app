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
            new SizedBox.fromSize(
              size: new Size.fromHeight(300.0),
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.monetization_on),
                    title: new Text('some record'),
                    subtitle: new Text('Category\n"Description"'),
                    trailing: new Column(
                      children: <Widget>[
                        new Text('-200,0€'),
                        new Text('24.04.18'),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.monetization_on),
                    title: new Text('some record'),
                    subtitle: new Text('Category\n"Description"'),
                    trailing: new Column(
                      children: <Widget>[
                        new Text('-200,0€'),
                        new Text('24.04.18'),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.monetization_on),
                    title: new Text('some record'),
                    subtitle: new Text('Category\n"Description"'),
                    trailing: new Column(
                      children: <Widget>[
                        new Text('-200,0€'),
                        new Text('24.04.18'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Text('Footer'),
          ],
        ),
      ),
    );
  }
}
