import 'package:flutter/material.dart';

import 'package:kapitalist/ui/drawer_page.dart';
import 'package:kapitalist/ui/login_page.dart';
import 'package:kapitalist/ui/tabpages/account_tab_page.dart';

// FIXME: Remove this and properly structure app
import 'package:kapitalist/ui/cards/balance_chart_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: Remove this and add controller to page
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
            AccountTabPage(),
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
