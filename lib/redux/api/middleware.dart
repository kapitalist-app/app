import 'package:shared_preferences/shared_preferences.dart';

import 'package:kapitalist/keys.dart';
import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/common/actions.dart';

/*class ApiMiddleware extends MiddlewareClass<AppState> {
  final SharedPreferences prefs;

  ApiMiddleware(this.prefs);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitAction) {
      await _loadBaseUrl(store);
    } else if (action is SetBaseUrlAction) {
        _saveBaseUrl(action.baseUrl);
    }
    next(action);
  }

  Future<Null> _loadBaseUrl(Store<AppState> store) async {
    final baseUrl = prefs.getString(KapitalistKeys.BASE_URL);

    if (baseUrl != null) {
      final uri = Uri.tryParse(baseUrl);
      if (uri != null) {
        print("Loaded baseUrl: baseUrl=$uri");
        store.dispatch(SetBaseUrlAction(uri));
      }
    }
  }

  Future<Null> _saveBaseUrl(Uri url) async {
    await prefs.setString(KapitalistKeys.BASE_URL, url.toString());
    print("Saved baseUrl: baseUrl=$url");
  }
}*/
