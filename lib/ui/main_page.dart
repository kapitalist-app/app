import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/ui/drawer_page.dart';
import 'package:kapitalist/ui/containers/register.dart';
import 'package:kapitalist/ui/tabpages/account_tab_page.dart';

// FIXME: Remove this and properly structure app
import 'package:kapitalist/ui/cards/balance_chart_card.dart';

class MainPage extends StatefulWidget {
  final Store store;

  MainPage(this.store);

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
              const Tab(icon: const Icon(Icons.account_balance_wallet)),
              const Tab(icon: const Icon(Icons.looks_two)),
              const Tab(icon: const Icon(Icons.looks_3)),
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
        endDrawer: new Container(
          color: Colors.white,
          child: ReduxDevTools<AppState>(widget.store),
        ),
        body: TabBarView(
          children: [
            AccountTabPage(),
            ListView(
              children: <Widget>[
                BalanceChartCard(),
              ],
            ),
            Register(),
          ],
        ),
      ),
    );
  }
}
