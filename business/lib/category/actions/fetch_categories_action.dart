import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/api/category_api.dart';
import 'package:business/category/actions/categories_fetched_action.dart';

class FetchCategoriesAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final baseUrl = state.api.baseUrl;
    final api = CategoryApi(baseUrl);

    final resps = await api.getCategories(state.auth.token);
    store.dispatch(CategoriesFetchedAction(resps));

    return null;
  }
}
