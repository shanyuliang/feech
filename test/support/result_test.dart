import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Success', () async {
    final result = Success(data: "Success");
    expect(result.dataOrNull, "Success");
  });

  test('Failure', () async {
    final result = Failure(error: Exception("Failure"));
    expect(result.dataOrNull, null);
  });

  test('Cancellation', () async {
    final result = Cancellation();
    expect(result.dataOrNull, null);
  });
}
