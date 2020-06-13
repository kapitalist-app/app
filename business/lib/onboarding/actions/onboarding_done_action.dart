import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/routes.dart';

class OnboardingDoneAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    // Navigate to home
    dispatch(NavigateAction.pushReplacementNamed(KapitalistRoutes.HOME));
    return state.rebuild((b) => b..onboardingDone = true);
  }
}
