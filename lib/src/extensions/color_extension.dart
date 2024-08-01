import 'dart:ui';

extension ColorExtension on Color {
  String toHexString() {
    return "#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
  }
}
