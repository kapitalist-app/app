import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/wallet_creation_request.dart';
import 'package:kapitalist/models/api/wallet_response.dart';

class CreateWalletAction {
  final WalletCreationRequest request;

  CreateWalletAction({@required this.request});
}

class WalletCreatedAction {
  final WalletResponse response;

  WalletCreatedAction({@required this.response});
}

class WalletsFetchedAction {
  final List<WalletResponse> response;

  WalletsFetchedAction({@required this.response});
}