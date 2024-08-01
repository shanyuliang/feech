import 'dart:ui';

extension ColorExtension on Color {
  String toHexString() {
    return value.toRadixString(16);
  }
}
