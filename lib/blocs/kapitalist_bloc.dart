import 'package:meta/meta.dart';

import 'package:kapitalist/blocs/authentication_bloc.dart';
import 'package:kapitalist/blocs/wallet_bloc.dart';

class KapitalistBloc {
  final AuthenticationBloc authBloc;
  final WalletBloc walletBloc;

  KapitalistBloc({
    @required this.authBloc,
    @required this.walletBloc,
  });

  void dispose() {
    authBloc.dispose();
    walletBloc.dispose();
  }
}
