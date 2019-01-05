import 'package:meta/meta.dart';

import 'package:kapitalist/blocs/authentication_bloc.dart';

class KapitalistBloc {
  final AuthenticationBloc authBloc;

  KapitalistBloc({
    @required this.authBloc,
  });

  void dispose() {
    authBloc.dispose();
  }
}
