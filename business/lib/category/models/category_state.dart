import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import 'package:business/category/models/category.dart';

part 'category_state.g.dart';

abstract class CategoryState
    implements Built<CategoryState, CategoryStateBuilder> {
  // Fields
  BuiltList<Category> get categories;

  // Constructor
  CategoryState._();

  factory CategoryState([updates(CategoryStateBuilder b)]) = _$CategoryState;

  // Initial state
  static CategoryState initial() =>
      CategoryState((b) => b..categories = <Category>[].build().toBuilder());
}
