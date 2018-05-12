import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/kapitalist_token.dart';

@immutable
class UserState {
  final String email;
  final String password;
  final KapitalistToken token;

  UserState({
    @required this.email,
    @required this.password,
    @required this.token,
  });

  factory UserState.initial() {
    return new UserState(
      email: "",
      password: "",
      token: null,
    );
  }

  UserState copyWith({String email, String password, KapitalistToken token}) {
    return UserState(
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token
    );
  }

  @override
  String toString() {
    return 'UserState{$email, $password, $token}';
  }
}
