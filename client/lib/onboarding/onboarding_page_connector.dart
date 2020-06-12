import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:business/app_state.dart';
import 'package:client/onboarding/onboarding_page.dart';

import 'package:client/onboarding/onboarding_viewmodel.dart';

class OnboardingPageConnector extends StatelessWidget {
  OnboardingPageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnboardingViewModel>(
        model: OnboardingViewModel(),
        builder: (BuildContext ctx, OnboardingViewModel vm) => OnboardingPage(
              onSetBaseUrl: vm.onSetBaseUrl,
              onDoAuth: vm.onDoAuth,
              onOnboardingDone: vm.onOnboardingDone,
            ));
  }
}
