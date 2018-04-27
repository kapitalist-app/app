import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CardTitle({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Padding(
            padding: new EdgeInsets.only(left: 5.0),
            child: new Text(
              this.title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        new IconButton(
          icon: new Icon(Icons.more_vert),
          onPressed: this.onPressed,
        ),
      ],
    );
  }
}
