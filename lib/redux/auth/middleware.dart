/*class AuthMiddleware extends MiddlewareClass<AppState> {
  final Client client;
  final SharedPreferences prefs;

  AuthMiddleware(this.client, this.prefs);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitAction) {
      await _loadCredentials(store);
    } else if (action is DoAuthAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.api.api;
      // XXX: api currently throws
      var success = false;
      switch (action.type) {
        case AuthType.REGISTER:
          success = await api.register(action.data.email, action.data.password);
          break;
        case AuthType.LOGIN:
          success = await api.login(action.data.email, action.data.password);
          break;
      }
      if (success) {
        _saveCredentials(action.data);
        store.dispatch(AuthSuccessfulAction(action.data));
      } else {
        store.dispatch(AuthFailedAction());
      }
    }
    next(action);
  }

  Future<Null> _loadCredentials(Store<AppState> store) async {
    final email = prefs.getString(KapitalistKeys.EMAIL);
    final password = prefs.getString(KapitalistKeys.PASSWORD);

    if (email != null && password != null) {
      print("Loaded credentials: email=$email, password=$password");

      final data = RegisterLoginData((b) => b
        ..email = email
        ..password = password);
      store.dispatch(DoAuthAction(AuthType.LOGIN, data));
    }
  }

  Future<Null> _saveCredentials(RegisterLoginData data) async {
    await prefs.setString(KapitalistKeys.EMAIL, data.email);
    await prefs.setString(KapitalistKeys.PASSWORD, data.password);
    print("Saved credentials: email=${data.email}, password=${data.password}");
  }
}*/
