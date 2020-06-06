import 'dart:ui';
import 'package:test/test.dart';

import 'package:business/util.dart';

void main() {
  group('parseHexColor', () {
    test('parses upper case', () {
      final c = Color.fromRGBO(42, 42, 42, 1);

      expect(c, Util.parseHexColor("2A2A2A"));
    });

    test('parses lower case', () {
      final c = Color.fromRGBO(42, 42, 42, 1);

      expect(c, Util.parseHexColor("2a2a2a"));
    });

    test('parses mixed case', () {
      final c = Color.fromRGBO(42, 42, 42, 1);

      expect(c, Util.parseHexColor("2A2a2A"));
    });

    test('ignores hex prefix', () {
      final c = Color.fromRGBO(42, 42, 42, 1);

      expect(c, Util.parseHexColor("0x2A2a2A"));
      expect(c, Util.parseHexColor("0X2A2a2A"));
    });
  });
}
