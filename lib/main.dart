import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:kapitalist/ui/widgets/balance_card.dart';
import 'package:kapitalist/ui/widgets/balance_chart_card.dart';
import 'package:kapitalist/ui/widgets/last_records_card.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kapitalist',
      home: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          backgroundColor: const Color(0xFFEEEEEE),
          appBar: new AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {},
            ),
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.account_balance_wallet)),
                new Tab(icon: new Icon(Icons.looks_two)),
                new Tab(icon: new Icon(Icons.looks_3)),
              ],
            ),
            title: new Text('Kapitalist'),
          ),
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {},
          ),
          body: new TabBarView(
            children: [
              new ListView(
                children: <Widget>[
                  new BalanceCard(),
                  new BalanceChartCard(),
                  //new LastRecordsCard(),
                ],
              ),
              new SimplePieChart.withSampleData(),
              new Icon(Icons.looks_3),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext ctx) {
    final words = new WordPair.random();
    return new Text(words.asPascalCase);
  }
}
