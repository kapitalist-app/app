import 'package:meta/meta.dart';

import 'package:kapitalist/models/category.dart';

class CategoryState {
  final List<Category> categories;

  const CategoryState({
    @required this.categories,
  });

  factory CategoryState.initial() {
    return CategoryState(
      categories: const <Category>[],
    );
  }
}
