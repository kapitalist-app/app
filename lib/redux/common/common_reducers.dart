import 'package:kapitalist/redux/common/common_actions.dart';

bool onboardingReducer(bool unboardingDone, dynamic action) {
  if (action is OnboardingDoneAction) {
    return true;
  }

  return unboardingDone;
}
