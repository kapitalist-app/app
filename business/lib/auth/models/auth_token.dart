import 'dart:convert' show json;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:business/serializers.dart';

part 'auth_token.g.dart';

abstract class AuthToken implements Built<AuthToken, AuthTokenBuilder> {
  // Fields
  @BuiltValueField(wireName: 'token')
  String get token;

  // Constructors
  AuthToken._();

  factory AuthToken([updates(AuthTokenBuilder b)]) = _$AuthToken;

  // Serialization
  String toJson() {
    return json.encode(serializers.serializeWith(AuthToken.serializer, this));
  }

  static AuthToken fromJson(String jsonString) {
    return serializers.deserializeWith(
        AuthToken.serializer, json.decode(jsonString));
  }

  static Serializer<AuthToken> get serializer => _$authTokenSerializer;
}
