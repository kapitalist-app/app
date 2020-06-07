import 'package:async_redux/async_redux.dart';

import 'package:business/business.dart';

class KapitalistPersistor extends Persistor<AppState> {
  final LocalPersist db = LocalPersist("kapitalist_app");

  @override
  Future<void> deleteState() async {
    await db.delete();
  }

  @override
  Future<void> persistDifference(
      {AppState lastPersistedState, AppState newState}) async {
    final lastState = lastPersistedState;

    if (lastState == null) {
      // FIXME: Persist complete state
      return;
    }

    if (lastState.auth != newState.auth) {
      // FIXME: Persist auth state here and continue with other sub states
    }
  }

  @override
  Future<AppState> readState() async {
    final objs = db.load();
    return AppState.initial();
  }
}
