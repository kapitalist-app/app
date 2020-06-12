import 'package:business/business.dart';

// Callbacks
typedef AuthCallback = void Function(AuthType, AuthData);
typedef ValidationCallback = Future<bool> Function();