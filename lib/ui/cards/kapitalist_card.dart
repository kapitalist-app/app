import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/card_title.dart';
import 'package:kapitalist/ui/util.dart';

class KapitalistCard extends StatelessWidget {
  final CardTitle title;
  final Widget child;

  KapitalistCard({
    @required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Column(
        children: <Widget>[
          this.title,
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: Container(
              decoration: UiUtil.simpleBorder(),
              width: double.infinity,
              child: this.child,
            ),
          ),
        ],
      ),
    );
  }
}
