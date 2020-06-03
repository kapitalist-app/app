import 'dart:async';
import 'dart:convert';

import 'package:business/api/api.dart';
import 'package:business/auth/models/auth_token.dart';
import 'package:business/transaction/models/transaction_creation_request.dart';
import 'package:business/transaction/models/transaction_response.dart';

class TransactionApi {
  // Constructor
  const TransactionApi(
    this.baseUrl,
  );

  // Methods
  Future<TransactionResponse> createTransaction(
      TransactionCreationRequest req, AuthToken token) async {
    final url = baseUrl.replace(path: '/transaction');
    final resp = await api.post(url, payload: req.toJson(), token: token);
    final tx = TransactionResponse.fromJson(resp);
    return tx;
  }

  Future<List<TransactionResponse>> getTransactions(
      int walletId, AuthToken token) async {
    final url = baseUrl.replace(path: '/transaction/all/$walletId');
    final resp = await api.get(url, token: token);
    final list = json.decode(resp);
    final txs = list
            ?.map<TransactionResponse>(
                (raw) => TransactionResponse.fromMap(raw))
            ?.toList() ??
        <TransactionResponse>[];
    return txs;
  }

  // Fields
  final Api api = const Api();
  final Uri baseUrl;
}
