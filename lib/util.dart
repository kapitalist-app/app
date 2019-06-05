import 'dart:ui';

class Util {
  static Color parseHexColor(String color) {
    final r = color.substring(0, 2);
    final g = color.substring(2, 4);
    final b = color.substring(4, 6);
    return Color.fromARGB(0, int.parse(r, radix: 16), int.parse(g, radix: 16), int.parse(b, radix: 16));
  }
}
