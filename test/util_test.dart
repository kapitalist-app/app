import 'dart:ui';
import 'package:test/test.dart';

import 'package:kapitalist/util.dart';

void main() {
  test('parseHexColor parses upper case', () {
    final c = Color.fromRGBO(42, 42, 42, 1);

    expect(c, Util.parseHexColor("2A2A2A"));
  });

  test('parseHexColor parses lower case', () {
    final c = Color.fromRGBO(42, 42, 42, 1);

    expect(c, Util.parseHexColor("2a2a2a"));
  });

  test('parseHexColor parses mixed case', () {
    final c = Color.fromRGBO(42, 42, 42, 1);

    expect(c, Util.parseHexColor("2A2a2A"));
  });

  test('parseHexColor ignores hex prefix', () {
    final c = Color.fromRGBO(42, 42, 42, 1);

    expect(c, Util.parseHexColor("0x2A2a2A"));
    expect(c, Util.parseHexColor("0X2A2a2A"));
  });
}
