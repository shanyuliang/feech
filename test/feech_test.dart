import 'package:flutter_test/flutter_test.dart';

import 'package:feech/feech.dart';

void main() {
  test('String.asNameGetInitials()', () {
    final initial= "Luke Shan".asNameGetInitials();
    expect(initial, "LS");
  });
}
