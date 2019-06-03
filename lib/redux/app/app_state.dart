import 'package:meta/meta.dart';

import 'package:kapitalist/redux/api/api_state.dart';
import 'package:kapitalist/redux/auth/auth_state.dart';
import 'package:kapitalist/redux/wallet/wallet_state.dart';

class AppState {
  final bool onboardingDone;
  final ApiState apiState;
  final AuthState authState;
  final WalletState walletState;

  const AppState({
    @required this.onboardingDone,
    @required this.apiState,
    @required this.authState,
    @required this.walletState,
  });

  factory AppState.initial() {
    return AppState(
      onboardingDone: false,
      apiState: ApiState.initial(),
      authState: AuthState.initial(),
      walletState: WalletState.initial(),
    );
  }

  AppState copyWith({
    bool onboardingDone,
    ApiState apiState,
    AuthState authState,
    WalletState walletState,
  }) {
    return AppState(
      onboardingDone: onboardingDone ?? this.onboardingDone,
      apiState: apiState ?? this.apiState,
      authState: authState ?? this.authState,
      walletState: walletState ?? this.walletState,
    );
  }
}
