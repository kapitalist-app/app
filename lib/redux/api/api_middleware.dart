import 'package:http/http.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';

import 'package:kapitalist/models/register_login_data.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/auth/auth_actions.dart';
import 'package:kapitalist/redux/common/common_actions.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  static const String KEY_BASEURL = "__baseurl__";

  final KeyValueStore kvStore;

  ApiMiddleware(this.kvStore);

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
    final baseUrl = kvStore.getString(KEY_BASEURL);

    if (baseUrl != null) {
      final uri = Uri.tryParse(baseUrl);
      if (uri != null) {
        print("Loaded baseUrl: baseUrl=$uri");
        store.dispatch(SetBaseUrlAction(uri));
      }
    }
  }

  Future<Null> _saveBaseUrl(Uri url) async {
    await kvStore.setString(KEY_BASEURL, url.toString());
    print("Saved baseUrl: baseUrl=$url");
  }
}
