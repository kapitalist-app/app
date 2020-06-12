import 'package:test/test.dart';

import 'package:business/auth/models/auth_state.dart';

void main() {
  group('serialization', () {
    test('full cycle', () {
      final state = AuthState.initial();
      final map = state.toMap();
      final result = AuthState.fromMap(map);
      expect(result, state);

      final newState = state.rebuild((b) => b..token.token = "foobar");
      final newMap = newState.toMap();
      final newResult = AuthState.fromMap(newMap);
      expect(newResult, newState);
    });
  });
}
