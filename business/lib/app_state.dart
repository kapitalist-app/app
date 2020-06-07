import 'package:built_value/built_value.dart';

import 'package:business/auth/models/auth_state.dart';
import 'package:business/category/models/category_state.dart';
import 'package:business/transaction/models/transaction_state.dart';
import 'package:business/wallet/models/wallet_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  // Fields
  /// Flag indicating, if onboarding was finished
  bool get onboardingDone;

  /// API base URL
  @nullable
  Uri get baseUrl;

  /// Authentication related state
  AuthState get auth;

  /// Category related state
  CategoryState get category;

  /// Transaction related state
  TransactionState get transaction;

  /// Wallet related state
  WalletState get wallet;

  // Constructors
  AppState._();

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  // Initial state
  static AppState initial() {
    return AppState((b) => b
      ..onboardingDone = false
      ..baseUrl = null
      ..auth = AuthState.initial().toBuilder()
      ..category = CategoryState.initial().toBuilder()
      ..transaction = TransactionState.initial().toBuilder()
      ..wallet = WalletState.initial().toBuilder());
  }
}
