import 'dart:convert' show json;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:business/serializers.dart';

part 'transaction_response.g.dart';

abstract class TransactionResponse
    implements Built<TransactionResponse, TransactionResponseBuilder> {
  // Fields
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'wallet_id')
  int get walletId;

  @BuiltValueField(wireName: 'category_id')
  int get categoryId;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'amount')
  int get amount;

  @BuiltValueField(wireName: 'ts')
  DateTime get timestamp;

  // Constructors
  TransactionResponse._();

  factory TransactionResponse([updates(TransactionResponseBuilder b)]) =
  _$TransactionResponse;

  // Serialization
  static Serializer<TransactionResponse> get serializer =>
      _$transactionResponseSerializer;

  String toJson() {
    return json.encode(
        serializers.serializeWith(TransactionResponse.serializer, this));
  }

  static TransactionResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        TransactionResponse.serializer, json.decode(jsonString));
  }

  static TransactionResponse fromMap(Map map) {
    return serializers.deserializeWith(TransactionResponse.serializer, map);
  }
}
