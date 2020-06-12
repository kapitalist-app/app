import 'package:test/test.dart';

import 'package:business/business.dart';

import 'package:kapitalist/persistor.dart';

void main() {
  group('auth', () {
    test('stores auth', () async {
      final state = AppState.initial();
      final persistor = KapitalistPersistor();

      await persistor.persistDifference(newState: state);
    });
  });
}
