import 'dart:convert' show json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:kapitalist/models/serializers.dart';

part 'category_response.g.dart';

abstract class CategoryResponse
    implements Built<CategoryResponse, CategoryResponseBuilder> {
  CategoryResponse._();

  factory CategoryResponse([updates(CategoryResponseBuilder b)]) = _$CategoryResponse;

  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  int get userId;

  @nullable
  @BuiltValueField(wireName: 'parent_id')
  int get parentId;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'color')
  String get color;

  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CategoryResponse.serializer, this));
  }

  static CategoryResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        CategoryResponse.serializer, json.decode(jsonString));
  }

  static CategoryResponse fromMap(Map map) {
    return serializers.deserializeWith(CategoryResponse.serializer, map);
  }

  static Serializer<CategoryResponse> get serializer =>
      _$categoryResponseSerializer;
}
