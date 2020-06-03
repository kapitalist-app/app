import 'package:meta/meta.dart';

import 'package:business/auth/models/auth_token.dart';

class ApiState {
  final Uri baseUrl;

  const ApiState({
    @required this.baseUrl,
  });

  factory ApiState.initial() {
    return ApiState(
      baseUrl: null,
    );
  }
}
