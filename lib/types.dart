import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_type.dart';

typedef AuthCallback = void Function(AuthType, AuthData);
typedef UrlCallback = void Function(Uri);
typedef ValidationCallback = Future<bool> Function();