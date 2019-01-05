import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapitalist/blocs/bloc_provider.dart';

import 'package:kapitalist/routes.dart';
import 'package:kapitalist/blocs/authentication_bloc.dart';
import 'package:kapitalist/blocs/kapitalist_bloc.dart';
import 'package:kapitalist/ui/main_page.dart';
import 'package:kapitalist/ui/pages/login_register_page.dart';

main() {
  runApp(BlocProvider<KapitalistBloc>(
      builder: (_, bloc) =>
          bloc ?? KapitalistBloc(authBloc: AuthenticationBloc()),
      onDispose: (_, bloc) => bloc.dispose(),
      child: new KapitalistApp()));
}

class KapitalistApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kapitalist',
      // TODO: investigate why the keyboard only works when login is home instead of regular route
      home: new LoginRegisterPage(
        signupState: SignupState.LOGIN,
        bloc: Provider.of<KapitalistBloc>(context).authBloc,
      ),
      routes: {
        /*KapitalistRoutes.ROOT: (ctx) {
              return new Login();
            },*/
        KapitalistRoutes.HOME: (ctx) {
          return new MainPage();
        },
        KapitalistRoutes.ADD_TRANSACTION: (ctx) {
          return new Container();
        },
      },
    );
  }
}
