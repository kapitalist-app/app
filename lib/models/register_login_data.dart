import 'dart:convert' show json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:kapitalist/models/serializers.dart';

part 'register_login_data.g.dart';

abstract class RegisterLoginData
    implements Built<RegisterLoginData, RegisterLoginDataBuilder> {
  RegisterLoginData._();

  factory RegisterLoginData([updates(RegisterLoginDataBuilder b)]) =
      _$RegisterLoginData;

  @BuiltValueField(wireName: 'email')
  String get email;

  @BuiltValueField(wireName: 'password')
  String get password;

  String toJson() {
    return json
        .encode(serializers.serializeWith(RegisterLoginData.serializer, this));
  }

  static RegisterLoginData fromJson(String jsonString) {
    return serializers.deserializeWith(
        RegisterLoginData.serializer, json.decode(jsonString));
  }

  static Serializer<RegisterLoginData> get serializer =>
      _$registerLoginDataSerializer;
}
