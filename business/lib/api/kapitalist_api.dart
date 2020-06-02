import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:business/auth/models/auth_data.dart';
import 'package:business/auth/models/auth_token.dart';
import 'package:business/category/models/category_response.dart';
import 'package:business/transaction/models/transaction_creation_request.dart';
import 'package:business/transaction/models/transaction_response.dart';
import 'package:business/wallet/models/wallet_creation_request.dart';
import 'package:business/wallet/models/wallet_response.dart';

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
    final req = AuthData((b) => b
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
    final resp = await _get('/wallet/all');
    final list = json.decode(resp);
    final wallets = list.map<WalletResponse>((raw) {
      return WalletResponse.fromMap(raw);
    }).toList();
    return wallets;
  }

  Future<TransactionResponse> createTransaction(TransactionCreationRequest req) async {
    final resp = await _post('/transaction', req.toJson());
    final transaction = TransactionResponse.fromJson(resp);
    return transaction;
  }

  Future<List<TransactionResponse>> getTransactions(int walletId) async {
    final resp = await _get('/transaction/all/$walletId');
    final list = json.decode(resp);
    final tx = list
        ?.map<TransactionResponse>((raw) => TransactionResponse.fromMap(raw))
        ?.toList() ?? <TransactionResponse>[];
    return tx;
  }

  Future<List<CategoryResponse>> getCategories() async {
    final resp = await _get('/category/all');
    final list = json.decode(resp);
    print(list);
    final categories = list
        ?.map<CategoryResponse>((raw) => CategoryResponse.fromMap(raw))
        ?.toList() ?? <CategoryResponse>[];
    return categories;
  }

  Future<AuthToken> _refreshToken() async {
    final req = AuthData((b) => b
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

  void _printResponse(http.Response resp) {
    var req = resp.request as http.Request;
    print("${req.method} ${req.url}");
    print("H: ${req.headers ?? '--'}");
    print("P: ${req.body ?? '--'}");
    print("=> ${resp.statusCode} - ${resp.body ?? '--'}");
  }

  Future<String> _get(String path, {bool retry = false}) async {
    return http
        .get(_baseUri.replace(path: path), headers: _getHeaders(true))
        .then((resp) {
      _printResponse(resp);
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized && !retry) {
        // Refresh token and retry once
        return _refreshToken().then((_) => _get(path, retry: true));
      } else if (code >= 400) {
        print("Error while GETing ${_baseUri.replace(path: path)}: ${code} - ${body}");
        return null;
      }

      return body;
    });
  }

  Future<String> _post(String path, String payload, {bool retry = false}) async {
    return http
        .post(_baseUri.replace(path: path),
        body: payload, headers: _getHeaders(true))
        .then((resp) {
      _printResponse(resp);
      final String body = resp.body;
      final int code = resp.statusCode;

      if (code == HttpStatus.unauthorized && !retry) {
        // Refresh token and retry once
        return _refreshToken().then((_) => _post(path, payload, retry: true));
      } else if (code >= 400) {
        print("Error while POSTing ${_baseUri.replace(path: path)}: ${code} - ${body}");
        return null;
      }

      return body;
    });
  }
}
