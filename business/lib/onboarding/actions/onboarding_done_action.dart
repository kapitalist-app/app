import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';

class OnboardingDoneAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.rebuild((b) => b..onboardingDone = true);
  }
}
