import 'package:kapitalist/models/category.dart';
import 'package:kapitalist/redux/category/actions.dart';
import 'package:kapitalist/redux/category/state.dart';

CategoryState categoryReducer(CategoryState state, dynamic action) {
  if (action is CategoriesFetchedAction) {
    var categories = action.response.map((w) => Category.fromResponse(w));
    return CategoryState(categories: List.unmodifiable(categories));
  }
  /*if (action is WalletCreatedAction) {
    var wallets = List.of(state.wallets);
    wallets.add(Wallet.fromResponse(action.response));
    return WalletState(wallets: List.unmodifiable(wallets));
  }*/
  // TODO: implement fully

  return state;
}
