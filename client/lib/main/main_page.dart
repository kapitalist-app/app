import 'package:flutter/material.dart';

import 'package:client/cards/mod.dart';
import 'package:client/common/drawer_page_connector.dart';
import 'package:client/tabpages/account_tab_page.dart';
import 'package:client/wallet/wallet_page.dart';

class MainPage extends StatefulWidget {
  final VoidCallback onCreateTransaction;

  MainPage({Key key, this.onCreateTransaction}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
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
        onPressed: widget.onCreateTransaction,
      ),
      body: DefaultTabController(
        length: 3,
        child: TabBarView(
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
