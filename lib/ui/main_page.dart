import 'package:flutter/material.dart';

import 'package:kapitalist/ui/cards/cards.dart';
import 'package:kapitalist/ui/drawer_page.dart';
import 'package:kapitalist/ui/login_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: const Icon(Icons.account_balance_wallet)),
              Tab(icon: const Icon(Icons.looks_two)),
              Tab(icon: const Icon(Icons.looks_3)),
            ],
          ),
          title: Text('Kapitalist'),
        ),
        drawer: Drawer(
          child: new DrawerPage(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                BalanceCard(),
                //BalanceChartCard(),
                LastRecordsCard(),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.widgets,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        // TODO:
                      },
                    ),
                    Text('ADD WIDGET'),
                  ],
                )
              ],
            ),
            ListView(
              children: <Widget>[
                BalanceChartCard(),
              ],
            ),
            LoginPage(),
          ],
        ),
      ),
    );
  }
}
