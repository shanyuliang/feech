import 'package:feech/feech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toHexString black', () {
    final s = Colors.black.toHexARGBString();
    expect(s, "#FF000000");
  });

  test('toHexString transparent', () {
    final s = Colors.transparent.toHexARGBString();
    expect(s, "#00000000");
  });

  test('toHexString red', () {
    final s = Colors.red.toHexARGBString();
    expect(s, "#FFF44336");
  });
}
