import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/models/models.dart';
import 'package:kapitalist/redux/reducers/app_state_reducer.dart';
import 'package:kapitalist/ui/widgets/balance_card.dart';
import 'package:kapitalist/ui/widgets/balance_chart_card.dart';
import 'package:kapitalist/ui/widgets/last_records_card.dart';
import 'package:kapitalist/ui/login_page.dart';

void main() => runApp(new KapitalistApp());

class KapitalistApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: new AppState(),
    // middleware: createMiddleware(),
  );

  KapitalistApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Kapitalist',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: const Color(0xFFEEEEEE),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              bottom: TabBar(
                tabs: [
                  Tab(icon: const Icon(Icons.account_balance_wallet)),
                  Tab(icon: const Icon(Icons.looks_two)),
                  Tab(icon: const Icon(Icons.looks_3)),
                ],
              ),
              title: Text('Kapitalist'),
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
        ),
      ),
    );
  }
}
