import 'package:kapitalist/api/kapitalist_api.dart';
import 'package:kapitalist/redux/api/api_state.dart';
import 'package:kapitalist/redux/common/common_actions.dart';

ApiState apiReducer(ApiState state, dynamic action) {
  if (action is SetBaseUrlAction) {
    final api = KapitalistApi(action.baseUrl);
    return ApiState(api: api, baseUrl: action.baseUrl);
  }

  return state;
}
