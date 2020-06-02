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
    api: apiReducer(state.api, action),
    auth: authReducer(state.auth, action),
    category: categoryReducer(state.category, action),
    transaction: transactionReducer(state.transaction, action),
    wallet: walletReducer(state.wallet, action),
  );
}
