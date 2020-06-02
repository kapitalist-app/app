import 'dart:convert' show json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:business/serializers.dart';

part 'auth_data.g.dart';

abstract class AuthData
    implements Built<AuthData, AuthDataBuilder> {
  AuthData._();

  factory AuthData([updates(AuthDataBuilder b)]) =
  _$AuthData;

  @BuiltValueField(wireName: 'email')
  String get email;

  @BuiltValueField(wireName: 'password')
  String get password;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AuthData.serializer, this));
  }

  static AuthData fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthData.serializer, json.decode(jsonString));
  }

  static Serializer<AuthData> get serializer =>
      _$authDataSerializer;
}
