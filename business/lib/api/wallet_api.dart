import 'dart:async';
import 'dart:convert';

import 'package:business/api/api.dart';
import 'package:business/auth/models/auth_token.dart';
import 'package:business/wallet/models/wallet_creation_request.dart';
import 'package:business/wallet/models/wallet_response.dart';

class WalletApi {
  // Constructor
  const WalletApi(
    this.baseUrl,
  );

  // Methods
  Future<WalletResponse> createWallet(
      WalletCreationRequest req, AuthToken token) async {
    final url = baseUrl.replace(path: '/wallet');
    final resp = await api.post(url, payload: req.toJson(), token: token);
    final wallet = WalletResponse.fromJson(resp);
    return wallet;
  }

  Future<List<WalletResponse>> getWallets(AuthToken token) async {
    final url = baseUrl.replace(path: '/wallet/all');
    final resp = await api.get(url, token: token);
    final list = json.decode(resp);
    final wallets = list?.map<WalletResponse>((raw) {
          return WalletResponse.fromMap(raw);
        })?.toList() ??
        <WalletResponse>[];
    return wallets;
  }

  // Fields
  final Api api = const Api();
  final Uri baseUrl;
}
