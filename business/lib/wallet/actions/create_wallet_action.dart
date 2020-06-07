import 'dart:async';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/api/wallet_api.dart';
import 'package:business/wallet/actions/wallet_created_action.dart';
import 'package:business/wallet/models/wallet_creation_request.dart';

class CreateWalletAction extends ReduxAction<AppState> {
  final WalletCreationRequest request;

  CreateWalletAction({@required this.request});

  @override
  Future<AppState> reduce() async {
    final baseUrl = state.baseUrl;
    final api = WalletApi(baseUrl);
    final resp = await api.createWallet(this.request, state.auth.token);
    if (resp != null) {
      dispatch(WalletCreatedAction(response: resp));
    }

    return null;
  }
}
