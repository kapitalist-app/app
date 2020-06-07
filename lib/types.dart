import 'package:business/business.dart';

// Callbacks
typedef AuthCallback = void Function(AuthType, AuthData);
typedef UrlCallback = void Function(Uri);
typedef ValidationCallback = Future<bool> Function();
typedef WalletCreationCallback = void Function(WalletCreationRequest);