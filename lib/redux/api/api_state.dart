import 'package:meta/meta.dart';

import 'package:kapitalist/api/kapitalist_api.dart';

class ApiState {
  const ApiState({
    @required this.baseUrl,
    @required this.api,
  });

  final Uri baseUrl;
  final KapitalistApi api;

  factory ApiState.initial() {
    return ApiState(
      baseUrl: null,
      api: null,
    );
  }
}
