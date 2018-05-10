import 'package:meta/meta.dart';

@immutable
class AppState {

  AppState();

  factory AppState.initial() {
    return new AppState();
  }

  @override
  String toString() {
      return 'AppState{}';
    }
}