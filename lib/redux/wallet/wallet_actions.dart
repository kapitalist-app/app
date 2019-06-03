import 'package:meta/meta.dart';

import 'package:kapitalist/models/wallet_creation_request.dart';
import 'package:kapitalist/models/wallet_response.dart';

class CreateWalletAction {
  final WalletCreationRequest request;

  CreateWalletAction({@required this.request});
}

class WalletCreatedAction {
  final WalletResponse wallet;

  WalletCreatedAction({@required this.wallet});
}
