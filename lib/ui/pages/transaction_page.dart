import 'package:flutter/material.dart';
import 'package:kapitalist/ui/util.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() {
    return new _TransactionPageState();
  }
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Transaction'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: UiUtil.buildTextFormField(null, 'Name', (_) => null),
          ),
        ],
      ),
    );
  }
}
