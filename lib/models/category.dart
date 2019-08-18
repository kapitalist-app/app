import 'package:meta/meta.dart';

import 'package:kapitalist/models/api/category_response.dart';

class Category {
  // From CategoryResponse
  final int id;
  final int userId;
  final int parentId;
  final String name;
  final String color;
  final DateTime createdAt;

  // App related XXX: Check if this is how we want to store this state

  const Category({
    @required this.id,
    @required this.userId,
    @required this.parentId,
    @required this.name,
    @required this.color,
    @required this.createdAt,
  });

  factory Category.fromResponse(CategoryResponse resp) => Category(
    id: resp.id,
    userId: resp.userId,
    parentId: resp.parentId,
    name: resp.name,
    color: resp.color,
    createdAt: resp.createdAt,
  );
}
