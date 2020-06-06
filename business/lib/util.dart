import 'dart:ui';

class Util {
  static Color parseHexColor(String color) {
    // Strip potential leading prefix
    final str = color.toLowerCase().replaceAll('0x', '');

    final r = str.substring(0, 2);
    final g = str.substring(2, 4);
    final b = str.substring(4, 6);
    return Color.fromRGBO(int.parse(r, radix: 16), int.parse(g, radix: 16), int.parse(b, radix: 16), 1);
  }

  static String pad2Zeroes(int number)
    => number.toString().padLeft(2, '0');
}
