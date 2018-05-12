import 'package:meta/meta.dart';

import 'package:kapitalist/models/state/state.dart';

@immutable
class AppState {
  final UserState userState;

  AppState({
    @required this.userState
  });

  factory AppState.initial() {
    return new AppState(
      userState: UserState.initial(),
    );
  }

  @override
  String toString() {
    return 'AppState{$userState}';
  }
}
