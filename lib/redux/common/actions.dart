import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:kapitalist/redux/state.dart';

class InitAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return null;
  }

}

// XXX: Decide where this should go
class OnboardingDoneAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    // TODO: implement reduce
    return null;
  }
}

class SetBaseUrlAction extends ReduxAction<AppState> {
  final Uri baseUrl;

  SetBaseUrlAction(this.baseUrl);

  @override
  FutureOr<AppState> reduce() {
    // TODO: implement reduce
    throw UnimplementedError();
  }
}
