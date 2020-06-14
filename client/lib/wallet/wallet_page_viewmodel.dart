import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:business/business.dart';

class WalletPageViewModel extends BaseModel<AppState> {
  WalletPageViewModel();

  ValueSetter<WalletCreationRequest> onSubmit;

  WalletPageViewModel.build({@required this.onSubmit}) : super(equals: []);

  @override
  BaseModel fromStore() => WalletPageViewModel.build(
        onSubmit: (WalletCreationRequest req) => {},
      );
}
