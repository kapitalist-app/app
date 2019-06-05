import 'package:meta/meta.dart';

import 'package:kapitalist/api/kapitalist_api.dart';

class ApiState {
  final Uri baseUrl;
  final KapitalistApi api;

  const ApiState({
    @required this.baseUrl,
    @required this.api,
  });

  factory ApiState.initial() {
    return ApiState(
      baseUrl: null,
      api: null,
    );
  }
}
