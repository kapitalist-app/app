import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final prefs = await SharedPreferences.getInstance();
    final state = await _loadState(prefs);
    return state;
  }

  Future<AppState> _loadState(SharedPreferences prefs) async {
    // FIXME: load state from prefs or somwhere else
    final _ = await Future.sync(() => prefs.getString("foo"));
    return AppState.initial();
  }
}