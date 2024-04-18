import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('randomString', () {
    final r = randomString(9);
    expect(r.length, 9);
  });
}
