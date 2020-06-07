import 'package:async_redux/async_redux.dart';
import 'package:built_collection/built_collection.dart';

import 'package:business/app_state.dart';
import 'package:business/category/models/category.dart';
import 'package:business/category/models/category_response.dart';

class CategoriesFetchedAction extends ReduxAction<AppState> {
  final List<CategoryResponse> response;

  CategoriesFetchedAction(this.response);

  @override
  AppState reduce() {
    final categories = this.response
        .map((w) => Category.fromResponse(w))
        .toBuiltList();
    return state.rebuild((b) => b
        ..category.update((b) => b
            ..categories = categories.toBuilder()));
  }
}
