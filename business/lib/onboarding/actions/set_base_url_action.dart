import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

import 'package:business/app_state.dart';
import 'package:business/keys.dart';
import 'package:business/api/api.dart';
import 'package:business/api/models/api_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetBaseUrlAction extends ReduxAction<AppState> {
  final Uri baseUrl;

  SetBaseUrlAction({@required this.baseUrl});

  @override
  Future<AppState> reduce() async {
    if (await Api().checkBaseUrl(this.baseUrl)) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(KapitalistKeys.BASE_URL, this.baseUrl.toString());
      return state.copyWith(apiState: ApiState(baseUrl: this.baseUrl));
    }
    return null;
  }
}