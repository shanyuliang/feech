import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('suppressThrowable - no error', () {
    final result = suppressThrowableSync(
      throwable: () {
        return 88 ~/ 1;
      },
      whenError: (error, stackTrace) {
        return 77;
      },
    );
    expect(result, 88);
  });

  test('suppressThrowable - error', () {
    final result = suppressThrowableSync(
      throwable: () {
        return 88 ~/ 0;
      },
      whenError: (error, stackTrace) {
        return 77;
      },
    );
    expect(result, 77);
  });

  test('suppressThrowable - error and error', () {
    final result = suppressThrowableSync(
      throwable: () {
        return 88 ~/ 0;
      },
      whenError: (error, stackTrace) {
        throw Exception("Yet another exception");
      },
    );
    expect(result, null);
  });
}
