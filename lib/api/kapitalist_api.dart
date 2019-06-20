import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kapitalist/models/api/transaction_creation_request.dart';
import 'package:kapitalist/models/api/transaction_response.dart';

import 'package:kapitalist/models/register_login_data.dart';
import 'package:kapitalist/models/api/auth_token.dart';
import 'package:kapitalist/models/api/wallet_creation_request.dart';
import 'package:kapitalist/models/api/wallet_response.dart';
import 'package:kapitalist/models/serializers.dart';

class KapitalistApi {
  // Base Uri
  final Uri _baseUri;

  // Authentication related
  String _email;
  String _password;
  AuthToken _token;

  // Constructor
  KapitalistApi(this._baseUri);

  Future<bool> register(String email, String password) async {
    // Save credentials for possible token refresh
    _email = email;
    _password = password;

    // Do register
    final req = RegisterLoginData((b) => b
          ..email = _email
          ..password = _password).toJson();
    // XXX: Replace this with _post
    final resp = await http.post(_baseUri.replace(path: '/register'),
        headers: _getHeaders(false),
        body: req);
    if (resp.statusCode != HttpStatus.ok) {
      // TODO: API should not throw
      throw new Exception("Unauthorized");
    }

    // Get token
    return _refreshToken() != null;
  }

  Future<bool> login(String email, String password) async {
    // Login is essentially setting the credentials and trying to get a token
    _email = email;
    _password = password;

    return _refreshToken() != null;
  }

  Future<WalletResponse> createWallet(WalletCreationRequest req) async {
    final resp = await _post('/wallet', req.toJson());
    final wallet = WalletResponse.fromJson(resp);
    print("Result of createWallet: $wallet");
    return wallet;
  }

  Future<List<WalletResponse>> getWallets() async {
    final resp = await _get('/wallets');
    final list = json.decode(resp);
    final wallets = list.map<WalletResponse>((raw) {
      return WalletResponse.fromMap(raw);
    }).toList();
    return wallets;
  }

  Future<TransactionResponse> createTransaction(TransactionCreationRequest req) async {
    final resp = await _post('/transaction', req.toJson());
    final transaction = TransactionResponse.fromJson(resp);
    print("Result of createTransaction: $transaction");
    return transaction;
  }

  Future<List<TransactionResponse>> getTransactions(int walletId) async {
    final resp = await _get('/transactions/$walletId');
    print(resp);
    final list = json.decode(resp);
    final tx = list?.map<TransactionResponse>((raw) {
      return TransactionResponse.fromMap(raw);
    })?.toList() ?? <TransactionResponse>[];
    return tx;
  }

  Future<AuthToken> _refreshToken() async {
    final req = RegisterLoginData((b) => b
          ..email = _email
          ..password = _password).toJson();

    final resp = await http.post(_baseUri.replace(path: '/token'),
        headers: _getHeaders(false),
        body: req);
    if (resp.statusCode != HttpStatus.ok) {
      return null;
    }

    // Save the token for later use
    _token = AuthToken.fromJson(resp.body);
    return _token;
  }

  Map<String, String> _getHeaders(bool withToken) {
    var map = {HttpHeaders.contentTypeHeader: 'application/json'};
    if (withToken) {
      if (_token != null) {
        map.addAll({HttpHeaders.authorizationHeader: 'Bearer ${_token.token}'});
      } else {
        print('[ERR] withToken was specified but _token is null');
      }
    }
    return map;
  }

  Future<String> _get(String path, {bool retry = false}) async {
    return http
        .get(_baseUri.replace(path: path), headers: _getHeaders(true))
        .then((resp) {
      print('get: ${resp.request}');
      print('get headers: ${resp.request.headers}');
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized && !retry) {
        // Refresh token and retry once
        return _refreshToken().then((_) => _get(path, retry: true));
      } else if (code > 400) {
        throw Exception(
            "Error while GETing ${_baseUri.replace(path: path)}");
      }

      return body;
    });
  }

  Future<String> _post(String path, String payload, {bool retry = false}) async {
    return http
        .post(_baseUri.replace(path: path),
            body: payload, headers: _getHeaders(true))
        .then((resp) {
      print('post: ${resp.request}');
      print('post headers: ${resp.request.headers}');
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized && !retry) {
        // Refresh token and retry once
        return _refreshToken().then((_) => _post(path, payload, retry: true));
      } else if (code > 400) {
        throw Exception(
            "Error while POSTing ${_baseUri.replace(path: path)}");
      }

      return body;
    });
  }
}
