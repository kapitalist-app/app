import 'package:meta/meta.dart';

import 'package:kapitalist/models/wallet_creation_request.dart';

class CreateWalletAction {
  final WalletCreationRequest request;

  CreateWalletAction({@required this.request});
}

class WalletCreatedAction {
  // XXX: Change to walle type when it is available
  final String wallet;

  WalletCreatedAction({@required this.wallet});
}
