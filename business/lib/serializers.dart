import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_state.dart';
import 'package:business/auth/models/auth_token.dart';
import 'package:business/category/models/category_response.dart';
import 'package:business/transaction/models/transaction_creation_request.dart';
import 'package:business/transaction/models/transaction_response.dart';
import 'package:business/wallet/models/wallet_creation_request.dart';
import 'package:business/wallet/models/wallet_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AuthData,
  AuthToken,
  AuthState,
  CategoryResponse,
  TransactionCreationRequest,
  TransactionResponse,
  WalletCreationRequest,
  WalletResponse,
])

final Serializers serializers = (_$serializers.toBuilder()
  ..add(Iso8601DateTimeSerializer())
  ..addPlugin(StandardJsonPlugin()))
    .build();
