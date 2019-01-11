import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:kapitalist/api/kapitalist_api.dart';
import 'package:kapitalist/models/wallet_creation_request.dart';

class WalletBloc {
// Backing Api
  final KapitalistApi _api;

  // Inputs
  Sink<WalletCreationRequest> get createWallet => _createWalletController.sink;

  // Outputs

  // Private
  final _createWalletController = StreamController<WalletCreationRequest>();

  WalletBloc(this._api) {
    print('WalletBloc.ctor()');
    // Set initial state
    // XXX: TODO

    // Wire up input streams
    _createWalletController.stream.listen(_onCreateWallet);
  }

  void _onCreateWallet(WalletCreationRequest req) {
    print('onCreateWallet: $req');
    _api.createWallet(req);
  }

  void dispose() {
    _createWalletController.close();
  }
}
