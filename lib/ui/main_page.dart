import 'package:flutter/material.dart';

import 'package:kapitalist/blocs/bloc_provider.dart';
import 'package:kapitalist/blocs/kapitalist_bloc.dart';
import 'package:kapitalist/ui/pages/drawer_page.dart';
import 'package:kapitalist/ui/pages/wallet_page.dart';
import 'package:kapitalist/ui/tabpages/account_tab_page.dart';

// FIXME: Remove this and properly structure app
import 'package:kapitalist/ui/cards/balance_chart_card.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext ctx) {
    final bloc = Provider.of<KapitalistBloc>(ctx);
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
          child: new DrawerPage(bloc: bloc.authBloc),
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
            WalletPage(
              bloc: bloc.walletBloc
            ),
          ],
        ),
      ),
    );
  }
}
