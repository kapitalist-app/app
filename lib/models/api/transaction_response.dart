import 'dart:convert' show json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:kapitalist/models/serializers.dart';

part 'transaction_response.g.dart';

abstract class TransactionResponse
    implements Built<TransactionResponse, TransactionResponseBuilder> {
  TransactionResponse._();

  factory TransactionResponse([updates(TransactionResponseBuilder b)]) =
      _$TransactionResponse;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'wallet_id')
  int get walletId;

  @BuiltValueField(wireName: 'category_id')
  int get categoryId;

  @BuiltValueField(wireName: 'amount')
  int get amount;

  @BuiltValueField(wireName: 'ts')
  DateTime get timestamp;

  String toJson() {
    return json.encode(
        serializers.serializeWith(TransactionResponse.serializer, this));
  }

  static TransactionResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        TransactionResponse.serializer, json.decode(jsonString));
  }

  static Serializer<TransactionResponse> get serializer =>
      _$transactionResponseSerializer;
}
