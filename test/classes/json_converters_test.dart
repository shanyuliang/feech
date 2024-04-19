import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('DateTimeStringConverter', () async {
    const dateTimeStringConverter = DateTimeStringConverter();

    const dateTimeString = "2024-04-19T11:41:28.123456+10:00";
    final dateTime = dateTimeStringConverter.fromJson(dateTimeString);
    final dateTime2 = await dateTimeStringConverter.fromJsonEx(dateTimeString);
    final expectedDateTime = DateTime(2024, 4, 19, 11, 41, 28, 123, 456).toUtc();
    expect(dateTime, expectedDateTime);
    expect(dateTime2, expectedDateTime);

    final dateTimeObject = DateTime(2024, 4, 19, 11, 41, 28, 123, 456);
    final string = dateTimeStringConverter.toJson(dateTimeObject);
    final string2 = await dateTimeStringConverter.toJsonEx(dateTimeObject);
    const expectedString = "2024-04-19T11:41:28.123456+10:00";
    expect(string, expectedString);
    expect(string2, expectedString);

    final dateTimeObjectUtc = dateTimeObject.toUtc();
    final stringUtc = dateTimeStringConverter.toJson(dateTimeObjectUtc);
    final stringUtc2 = await dateTimeStringConverter.toJsonEx(dateTimeObjectUtc);
    const expectedStringUtc = "2024-04-19T01:41:28.123456Z";
    expect(stringUtc, expectedStringUtc);
    expect(stringUtc2, expectedStringUtc);
  });
}
