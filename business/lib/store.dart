import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:business/app_state.dart';

Store<AppState> createStore(Client client, SharedPreferences prefs) {
  return Store(
      initialState: AppState.initial()
  );
}