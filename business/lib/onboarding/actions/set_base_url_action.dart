import 'dart:async';
import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/api/api.dart';

class SetBaseUrlAction extends ReduxAction<AppState> {
  final Uri baseUrl;

  SetBaseUrlAction(this.baseUrl);

  @override
  Future<AppState> reduce() async {
    if (await Api().checkBaseUrl(this.baseUrl)) {
      return state.rebuild((b) => b..baseUrl = this.baseUrl);
    }
    return null;
  }
}
