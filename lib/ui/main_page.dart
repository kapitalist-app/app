import 'package:flutter/material.dart';
import 'package:kapitalist/routes.dart';

import 'package:kapitalist/ui/cards/cards.dart';
import 'package:kapitalist/ui/pages/drawer_page_connector.dart';
import 'package:kapitalist/ui/pages/wallet_page.dart';
import 'package:kapitalist/ui/tabpages/account_tab_page.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext ctx) {
    // TODO: Remove this and add controller to page
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              const Tab(icon: const Icon(Icons.account_balance_wallet)),
              const Tab(icon: const Icon(Icons.looks_two)),
              const Tab(icon: const Icon(Icons.looks_3)),
            ],
          ),
          title: Text('Kapitalist'),
        ),
        drawer: Drawer(
          child: new DrawerPageConnector(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(ctx).pushNamed(KapitalistRoutes.NEW_TRANSACTION);
          },
        ),
        body: TabBarView(
          children: [
            AccountTabPage(),
            ListView(
              children: <Widget>[
                BalanceChartCard(),
              ],
            ),
            WalletPage(),
          ],
        ),
      ),
    );
  }
}
