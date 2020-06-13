import 'package:business/business.dart';

// Callbacks
typedef AuthCallback = Future<bool> Function(AuthType, AuthData);
typedef BaseUrlCallback = Future<bool> Function(Uri);
typedef ValidationCallback = Future<bool> Function();