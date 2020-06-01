import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/keys.dart';
import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/common/actions.dart';

class CommonMiddleware extends MiddlewareClass<AppState> {
  final SharedPreferences prefs;

  CommonMiddleware(this.prefs);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitAction) {
      await _loadOnboardingDone(store);
    } else if (action is OnboardingDoneAction) {
        _saveOnboardingDone();
    }
    next(action);
  }

  Future<Null> _loadOnboardingDone(Store<AppState> store) async {
    final done = prefs.getBool(KapitalistKeys.ONBOARDING_DONE);
    print("Loaded onboardingDone: $done");

    if (done != null && done) {
      store.dispatch(OnboardingDoneAction());
    }
  }

  Future<Null> _saveOnboardingDone() async {
    await prefs.setBool(KapitalistKeys.ONBOARDING_DONE, true);
    print("Saved onboardingDone: true");
  }
}
