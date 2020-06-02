/*class CategoryMiddleware extends MiddlewareClass<AppState> {

  final Client client;

  CategoryMiddleware(this.client);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is AuthSuccessfulAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.api.api;
      // XXX: api currently throws
      final resp = await api.getCategories();
      store.dispatch(CategoriesFetchedAction(response: resp));
    }
    /*else if (action is CreateCategoryAction) {
      // XXX: Check if this is okay or if api might be "old state"
      final api = store.state.apiState.api;
      // XXX: api currently throws
      final resp = await api.createWallet(action.request);
      store.dispatch(CategoryCreatedAction(response: resp));
    }*/
    next(action);
  }
}*/
