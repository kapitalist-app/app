import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/category_response.dart';

class CategoriesFetchedAction {
  final List<CategoryResponse> response;

  CategoriesFetchedAction({@required this.response});
}