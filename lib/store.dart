import 'dart:async';

import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'package:kapitalist/api/kapitalist_api.dart';
import 'package:kapitalist/middleware/authentication_middleware.dart';
import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/reducers/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  //var prefs = await SharedPreferences.getInstance();

  var kapitalistApi = new KapitalistApi();

  return new DevToolsStore<AppState>(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: [
      new AuthenticationMiddleware(kapitalistApi),
      /*new TheaterMiddleware(rootBundle, prefs),
      new ShowMiddleware(finnkinoApi),
      new EventMiddleware(finnkinoApi),*/
    ],
  );
}
