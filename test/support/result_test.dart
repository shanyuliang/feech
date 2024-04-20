import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Success', () async {
    final result = Success(data: "Success");
    expect(result.dataOrNull, "Success");
    expect(result.errorOrNull, null);
  });

  test('Failure', () async {
    final error = Exception("Failure");
    final result = Failure(error: error);
    expect(result.dataOrNull, null);
    expect(result.errorOrNull, error);
  });

  test('Cancellation', () async {
    final result = Cancellation();
    expect(result.dataOrNull, null);
    expect(result.errorOrNull, null);
  });
}
