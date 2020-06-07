import 'dart:convert' show json;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:business/serializers.dart';

part 'wallet_creation_request.g.dart';

abstract class WalletCreationRequest
    implements Built<WalletCreationRequest, WalletCreationRequestBuilder> {
  // Fields
  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'wallet_type')
  String get walletType;

  @BuiltValueField(wireName: 'balance')
  int get balance;

  @BuiltValueField(wireName: 'color')
  String get color;

  // Constructors
  WalletCreationRequest._();

  factory WalletCreationRequest([updates(WalletCreationRequestBuilder b)]) =
  _$WalletCreationRequest;

  // Serialization
  String toJson() {
    return json.encode(
        serializers.serializeWith(WalletCreationRequest.serializer, this));
  }

  static WalletCreationRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        WalletCreationRequest.serializer, json.decode(jsonString));
  }

  static Serializer<WalletCreationRequest> get serializer =>
      _$walletCreationRequestSerializer;
}
