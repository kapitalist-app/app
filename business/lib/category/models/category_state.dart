import 'package:meta/meta.dart';

import 'package:business/category/models/category.dart';

class CategoryState {
  final List<Category> categories;

  const CategoryState({
    @required this.categories,
  });

  static CategoryState initial() {
    return CategoryState(
      categories: const <Category>[],
    );
  }
}
