import 'dart:async';

import 'package:redux/redux.dart';

import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/reducers/app_state_reducer.dart';

Future<Store<AppState>> createStore() async {
  //var prefs = await SharedPreferences.getInstance();

  //var finnkinoApi = new FinnkinoApi();

  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: [
      /*new ActorMiddleware(tmdbApi),
      new TheaterMiddleware(rootBundle, prefs),
      new ShowMiddleware(finnkinoApi),
      new EventMiddleware(finnkinoApi),*/
    ],
  );
}
