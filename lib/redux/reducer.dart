import 'package:kapitalist/redux/state.dart';
import 'package:kapitalist/redux/api/reducer.dart';
import 'package:kapitalist/redux/auth/reducer.dart';
import 'package:kapitalist/redux/category/reducer.dart';
import 'package:kapitalist/redux/common/reducers.dart';
import 'package:kapitalist/redux/transaction/reducer.dart';
import 'package:kapitalist/redux/wallet/reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    onboardingDone: onboardingReducer(state.onboardingDone, action),
    apiState: apiReducer(state.apiState, action),
    authState: authReducer(state.authState, action),
    categoryState: categoryReducer(state.categoryState, action),
    transactionState: transactionReducer(state.transactionState, action),
    walletState: walletReducer(state.walletState, action),
  );
}
