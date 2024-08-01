import 'package:feech/feech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toHexString black', () {
    final s = Colors.black.toHexString();
    expect(s, "#FF000000");
  });

  test('toHexString transparent', () {
    final s = Colors.transparent.toHexString();
    expect(s, "#00000000");
  });

  test('toHexString red', () {
    final s = Colors.red.toHexString();
    expect(s, "#FFF44336");
  });
}
