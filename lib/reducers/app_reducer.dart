import 'package:kapitalist/models/app_state.dart';
import 'package:kapitalist/reducers/reducers.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    userState: userReducer(state.userState, action),
  );
}
