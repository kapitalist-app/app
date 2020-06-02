import 'package:meta/meta.dart';

import 'package:kapitalist/redux/api/state.dart';
import 'package:kapitalist/redux/auth/state.dart';
import 'package:kapitalist/redux/category/state.dart';
import 'package:kapitalist/redux/transaction/state.dart';
import 'package:kapitalist/redux/wallet/state.dart';

class AppState {
  final bool onboardingDone;
  final ApiState api;
  final AuthState auth;
  final CategoryState category;
  final TransactionState transaction;
  final WalletState wallet;

  const AppState({
    @required this.onboardingDone,
    @required this.api,
    @required this.auth,
    @required this.category,
    @required this.transaction,
    @required this.wallet,
  });

  static AppState initial() {
    return AppState(
      onboardingDone: false,
      api: ApiState.initial(),
      auth: AuthState.initial(),
      category: CategoryState.initial(),
      transaction: TransactionState.initial(),
      wallet: WalletState.initial(),
    );
  }

  AppState copyWith({
    bool onboardingDone,
    ApiState apiState,
    AuthState authState,
    CategoryState categoryState,
    TransactionState transactionState,
    WalletState walletState,
  }) {
    return AppState(
      onboardingDone: onboardingDone ?? this.onboardingDone,
      api: apiState ?? this.api,
      auth: authState ?? this.auth,
      category: categoryState ?? this.category,
      transaction: transactionState ?? this.transaction,
      wallet: walletState ?? this.wallet,
    );
  }
}
