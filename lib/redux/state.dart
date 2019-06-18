import 'package:meta/meta.dart';

import 'package:kapitalist/redux/api/state.dart';
import 'package:kapitalist/redux/auth/state.dart';
import 'package:kapitalist/redux/transaction/state.dart';
import 'package:kapitalist/redux/wallet/state.dart';

class AppState {
  final bool onboardingDone;
  final ApiState apiState;
  final AuthState authState;
  final TransactionState transactionState;
  final WalletState walletState;

  const AppState({
    @required this.onboardingDone,
    @required this.apiState,
    @required this.authState,
    @required this.transactionState,
    @required this.walletState,
  });

  factory AppState.initial() {
    return AppState(
      onboardingDone: false,
      apiState: ApiState.initial(),
      authState: AuthState.initial(),
      transactionState: TransactionState.initial(),
      walletState: WalletState.initial(),
    );
  }
}
