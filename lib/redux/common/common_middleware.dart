import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/common/common_actions.dart';

class CommonMiddleware extends MiddlewareClass<AppState> {
  static const String KEY_ONBOARDING_DONE = "__onboarding_done__";

  final KeyValueStore kvStore;

  CommonMiddleware(this.kvStore);

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
    final done = kvStore.getBool(KEY_ONBOARDING_DONE);
    print("Loaded onboardingDone: $done");

    if (done != null && done) {
      store.dispatch(OnboardingDoneAction());
    }
  }

  Future<Null> _saveOnboardingDone() async {
    await kvStore.setBool(KEY_ONBOARDING_DONE, true);
    print("Saved onboardingDone: true");
  }
}
