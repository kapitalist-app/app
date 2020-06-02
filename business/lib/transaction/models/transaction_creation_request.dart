import 'dart:convert' show json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:business/serializers.dart';

part 'transaction_creation_request.g.dart';

abstract class TransactionCreationRequest
    implements Built<TransactionCreationRequest, TransactionCreationRequestBuilder> {
  TransactionCreationRequest._();

  factory TransactionCreationRequest([updates(TransactionCreationRequestBuilder b)]) =
      _$TransactionCreationRequest;

  @BuiltValueField(wireName: 'wallet_id')
  int get walletId;

  @BuiltValueField(wireName: 'category_id')
  int get categoryId;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'amount')
  int get amount;

  @nullable
  @BuiltValueField(wireName: 'ts')
  DateTime get timestamp;

  String toJson() {
    return json.encode(
        serializers.serializeWith(TransactionCreationRequest.serializer, this));
  }

  static TransactionCreationRequest fromJson(String jsonString) {
    return serializers.deserializeWith(
        TransactionCreationRequest.serializer, json.decode(jsonString));
  }

  static Serializer<TransactionCreationRequest> get serializer =>
      _$transactionCreationRequestSerializer;
}
