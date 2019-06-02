import 'package:meta/meta.dart';

import 'package:kapitalist/redux/api/api_state.dart';
import 'package:kapitalist/redux/auth/auth_state.dart';

class AppState {
  final bool onboardingDone;
  final ApiState apiState;
  final AuthState authState;

  const AppState({
    @required this.onboardingDone,
    @required this.apiState,
    @required this.authState,
  });

  factory AppState.initial() {
    return AppState(
      onboardingDone: false,
      apiState: ApiState.initial(),
      authState: AuthState.initial(),
    );
  }

  AppState copyWith({
    bool onboardingDone,
    ApiState apiState,
    AuthState authState,
  }) {
    return AppState(
      onboardingDone: onboardingDone ?? this.onboardingDone,
      apiState: apiState ?? this.apiState,
      authState: authState ?? this.authState,
    );
  }
}
