import 'package:kapitalist/models/register_login_data.dart';

// XXX: Decide where this should go
enum AuthType {
  REGISTER,
  LOGIN
}

class DoAuthAction {
  final AuthType type;
  final RegisterLoginData data;

  DoAuthAction(this.type, this.data);
}

class AuthSuccessfulAction {
  final RegisterLoginData data;

  AuthSuccessfulAction(this.data);
}

class AuthFailedAction {
  // XXX: Figure our what belongs here
}
