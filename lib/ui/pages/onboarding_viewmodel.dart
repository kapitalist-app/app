import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:business/business.dart';

import 'package:kapitalist/types.dart';

class OnboardingViewModel extends BaseModel<AppState> {
  OnboardingViewModel();

  UrlCallback onSetBaseUrl;
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
      onSetBaseUrl: (url) => dispatch(SetBaseUrlAction(url)),
      onDoAuth: (type, data) => dispatch(DoAuthAction(type, data)),
      onOnboardingDone: () => dispatch(OnboardingDoneAction()));
}
