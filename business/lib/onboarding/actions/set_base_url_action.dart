import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

import 'package:business/app_state.dart';
import 'package:business/api/kapitalist_api.dart';
import 'package:business/api/models/api_state.dart';

class SetBaseUrlAction extends ReduxAction<AppState> {
  final Uri baseUrl;

  SetBaseUrlAction({@required this.baseUrl});

  @override
  AppState reduce() {
    final api = KapitalistApi(this.baseUrl);
    return state.copyWith(apiState: ApiState(api: api, baseUrl: this.baseUrl));
  }
}