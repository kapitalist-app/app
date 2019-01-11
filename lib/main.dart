import 'package:flutter/material.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/api/kapitalist_api.dart';
import 'package:kapitalist/blocs/authentication_bloc.dart';
import 'package:kapitalist/blocs/bloc_provider.dart';
import 'package:kapitalist/blocs/kapitalist_bloc.dart';
import 'package:kapitalist/blocs/wallet_bloc.dart';
import 'package:kapitalist/ui/main_page.dart';
import 'package:kapitalist/ui/pages/register_login_page.dart';
import 'package:kapitalist/ui/pages/transaction_page.dart';
import 'package:kapitalist/ui/pages/wallet_page.dart';

main() {
  var api = KapitalistApi();
  var app = BlocProvider<KapitalistBloc>(
      builder: (_, bloc) =>
          bloc ??
          KapitalistBloc(
              authBloc: AuthenticationBloc(api), walletBloc: WalletBloc(api)),
      onDispose: (_, bloc) => bloc.dispose(),
      child: new KapitalistApp());
  runApp(app);
}

class KapitalistApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of<KapitalistBloc>(context);
    final loginPage = new RegisterLoginPage(
      signupState: SignupState.LOGIN,
      bloc: bloc.authBloc,
    );
    return new MaterialApp(
      title: 'Kapitalist',
      initialRoute: KapitalistRoutes.ROOT,
      routes: {
        // TODO: investigate why the keyboard only works when login is home instead of regular route
        KapitalistRoutes.ROOT: (ctx) {
          print('#### Building page for ${KapitalistRoutes.ROOT} ####');
          /*return MaterialPageRoute(
              builder: (ctx) => LoginRegisterPage(
                    signupState: SignupState.LOGIN,
                    bloc: Provider.of<KapitalistBloc>(ctx).authBloc,
                  ));*/
          return loginPage;
        },
        KapitalistRoutes.LOGIN: (ctx) {
          print('#### Building page for ${KapitalistRoutes.LOGIN} ####');
          return loginPage;
        },
        KapitalistRoutes.HOME: (ctx) {
          print('#### Building page for ${KapitalistRoutes.HOME} ####');
          return new MainPage();
        },
        KapitalistRoutes.NEW_WALLET: (ctx) {
          print('#### Building page for ${KapitalistRoutes.NEW_WALLET} ####');
          return new WalletPage(bloc: bloc.walletBloc);
        },
        KapitalistRoutes.NEW_TRANSACTION: (ctx) {
          print(
              '#### Building page for ${KapitalistRoutes.NEW_TRANSACTION} ####');
          return new TransactionPage();
        },
      },
    );
  }
}
