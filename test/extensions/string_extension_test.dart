import 'package:feech/feech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('asNameGetInitials 2 characters', () {
    final initial = "Luke Shan".asNameGetInitials();
    expect(initial, "LS");
  });

  test('asNameGetInitials 3 characters', () {
    final initial = "Bridget Tang Shan".asNameGetInitials();
    expect(initial, "BTS");
  });

  test('asNameGetInitials 4 characters', () {
    final initial = "Emma Tang Dou Shan".asNameGetInitials();
    expect(initial, "ETDS");
  });

  test('asNameGetInitials 4 characters with max 3 characters limit', () {
    final initial = "Emma Tang Dou Shan".asNameGetInitials(maxResultLength: 3);
    expect(initial, "ETD");
  });

  test('parseAsHexColor black', () {
    final c = "#FF000000".parseAsHexARGBColor();
    expect(c, Colors.black);
  });

  test('parseAsHexColor transparent', () {
    final c = "#00000000".parseAsHexARGBColor();
    expect(c, Colors.transparent);
  });

  test('parseAsHexColor red', () {
    final c = "#FFF44336".parseAsHexARGBColor();
    expect(c, Colors.red.shade500);
  });
}
