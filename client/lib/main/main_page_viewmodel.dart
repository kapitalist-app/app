import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

import 'package:business/business.dart';

class MainPageViewModel extends BaseModel<AppState> {
  MainPageViewModel();

  VoidCallback onCreateTransaction;

  MainPageViewModel.build({@required this.onCreateTransaction})
      : super(equals: []);

  @override
  BaseModel fromStore() => MainPageViewModel.build(
      onCreateTransaction: () =>
          dispatch(NavigateAction.pushNamed(KapitalistRoutes.NEW_TRANSACTION)));
}
