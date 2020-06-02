import 'dart:async';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/wallet/models/wallet_creation_request.dart';

class CreateWalletAction extends ReduxAction<AppState> {
  final WalletCreationRequest request;

  CreateWalletAction({@required this.request});

  @override
  FutureOr<AppState> reduce() {
    // TODO: implement reduce
    throw UnimplementedError();
  }
}
