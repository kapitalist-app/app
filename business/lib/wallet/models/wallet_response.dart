import 'dart:convert' show json;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:business/serializers.dart';

part 'wallet_response.g.dart';

abstract class WalletResponse
    implements Built<WalletResponse, WalletResponseBuilder> {
  // Fields
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'wallet_type')
  String get walletType;

  @BuiltValueField(wireName: 'current_balance')
  int get balance;

  @BuiltValueField(wireName: 'color')
  String get color;

  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  // Constructors
  WalletResponse._();

  factory WalletResponse([updates(WalletResponseBuilder b)]) = _$WalletResponse;

  // Serialization
  String toJson() {
    return json
        .encode(serializers.serializeWith(WalletResponse.serializer, this));
  }

  static WalletResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        WalletResponse.serializer, json.decode(jsonString));
  }

  static WalletResponse fromMap(Map map) {
    return serializers.deserializeWith(WalletResponse.serializer, map);
  }

  static Serializer<WalletResponse> get serializer =>
      _$walletResponseSerializer;
}
