import 'package:async_redux/async_redux.dart';

import 'package:business/app_state.dart';
import 'package:business/category/models/category_state.dart';
import 'package:business/category/models/category.dart';
import 'package:business/category/models/category_response.dart';

class CategoriesFetchedAction extends ReduxAction<AppState> {
  final List<CategoryResponse> response;

  CategoriesFetchedAction(this.response);

  @override
  AppState reduce() {
    final categories = this.response.map((w) => Category.fromResponse(w));
    final categoryState =
        CategoryState(categories: List.unmodifiable(categories));
    return state.copyWith(categoryState: categoryState);
  }
}
