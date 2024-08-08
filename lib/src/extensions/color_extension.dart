import 'dart:ui';

extension ColorExtension on Color {
  String toHexARGBString() {
    return "#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
  }

  String toHexRGBAString() {
    final temp = value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return "#${temp.substring(2)}${temp.substring(0, 2)}";
  }
}
