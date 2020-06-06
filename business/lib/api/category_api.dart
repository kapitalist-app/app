import 'dart:async';
import 'dart:convert';

import 'package:business/api/api.dart';
import 'package:business/auth/models/auth_token.dart';
import 'package:business/category/models/category_response.dart';

class CategoryApi {
  // Constructor
  const CategoryApi(
    this.baseUrl,
  );

  // Methods
  Future<List<CategoryResponse>> getCategories(AuthToken token) async {
    final url = baseUrl.replace(path: '/category/all');
    final resp = await api.get(url, token: token);
    final list = json.decode(resp);
    final categories = list?.map<CategoryResponse>((raw) {
          return CategoryResponse.fromMap(raw);
        })?.toList() ??
        <CategoryResponse>[];
    return categories;
  }

  // Fields
  final Api api = const Api();
  final Uri baseUrl;
}
