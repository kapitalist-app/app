import 'package:kapitalist/redux/api/api_reducer.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/auth/auth_reducer.dart';
import 'package:kapitalist/redux/common/common_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    onboardingDone: onboardingReducer(state.onboardingDone, action),
    apiState: apiReducer(state.apiState, action),
    authState: authReducer(state.authState, action),
  );
}
