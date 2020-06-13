import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:business/business.dart';

import 'package:client/types.dart';

class OnboardingViewModel extends BaseModel<AppState> {
  OnboardingViewModel();

  BaseUrlCallback onSetBaseUrl;
  AuthCallback onDoAuth;
  VoidCallback onOnboardingDone;

  FormFieldValidator urlValidator;
  FormFieldValidator emailValidator;
  FormFieldValidator passwordValidator;

  OnboardingViewModel.build({
    @required this.onSetBaseUrl,
    @required this.onDoAuth,
    @required this.onOnboardingDone,
    this.urlValidator,
    this.emailValidator,
    this.passwordValidator,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => OnboardingViewModel.build(
      onSetBaseUrl: (url) async {
        await dispatchFuture(SetBaseUrlAction(url));
        return state.baseUrl != null;
      },
      onDoAuth: (type, data) async {
        await dispatchFuture(DoAuthAction(type, data));
        return state.auth.authenticated;
      },
      onOnboardingDone: () => dispatch(OnboardingDoneAction()),
      urlValidator: _validateUrl,
      emailValidator: _validateEmail,
      passwordValidator: _validatePassword);

  // Validation
  // Note: the parameters need to be untyped/dynamic to match FormFieldValidator signature
  String _validateUrl(url) {
    debugPrint('[OnboardingPageViewModel] Validating url: $url');
    return !url.contains('https') ? 'Url most begin with https' : null;
  }

  String _validateEmail(email) {
    debugPrint('[OnboardingPageViewModel] Validating email: $email');
    return !email.contains('@') ? 'Invalid email address' : null;
  }

  String _validatePassword(password) {
    debugPrint('[OnboardingPageViewModel] Validating password: $password');
    return null;
  }
}
