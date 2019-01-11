import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:kapitalist/models/auth_token.dart';
import 'package:kapitalist/models/register_login_data.dart';
import 'package:kapitalist/models/wallet_creation_request.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AuthToken,
  RegisterLoginData,
  WalletCreationRequest,
])

// By default, `built_value` serialization uses lists and is not compatible
// with other JSON formats. If you'd like to serialize data using a map-based
// JSON approach (which is what you'll find in the json_strings.dart file in
// this project), you can add the StandardJsonPlugin as you see here.
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

