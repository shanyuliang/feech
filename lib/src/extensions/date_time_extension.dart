import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  Timestamp toTimestamp() => Timestamp.fromDate(this);

  String timeZoneString({bool useZForUTC = true}) {
    if ((isUtc || timeZoneOffset == Duration.zero) && useZForUTC) {
      return 'Z';
    } else {
      return "${timeZoneOffset.isNegative ? "-" : "+"}${timeZoneOffset.inHours.abs().toString().padLeft(2, "0")}:${(timeZoneOffset.inMinutes - timeZoneOffset.inHours * 60).abs().toString().padLeft(2, "0")}";
    }
  }

  bool isToday() {
    final today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  bool wasYesterday() {
    final yesterday = DateTime.now().add(const Duration(days: -1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime yesterday() {
    return add(const Duration(days: -1));
  }

  DateTime tomorrow() {
    return add(const Duration(days: 1));
  }

  DateTime toDayTruncation() {
    return DateTime(year, month, day);
  }

  DateTime coerceIn({DateTime? min, DateTime? max}) {
    DateTime temp = add(Duration.zero);
    if (min == null && max == null) {
      return temp;
    } else {
      if (min != null && max != null) {
        assert(!min.isAfter(max));
      }
      if (min != null && temp.isBefore(min)) {
        temp = min;
      }
      if (max != null && temp.isAfter(max)) {
        temp = max;
      }
    }
    return temp;
  }

  /// This is to simulate C# behaviour. We guarantee the month will change to neighbour value and the day value is valid for that month.
  DateTime addMonths(int count) {
    int targetMonth = (month + count) % 12;
    if (targetMonth == 0) {
      targetMonth = 12;
    }
    DateTime result = DateTime(year, month + count, day, hour, minute, second, millisecond, microsecond);
    while (result.month != targetMonth) {
      result = result.subtract(const Duration(days: 1));
    }
    return result;
  }

  /// This is to simulate C# behaviour. We guarantee the month will NOT change and the day value is valid for that month.
  DateTime addYears(int count) {
    DateTime result = DateTime(year + count, month, day, hour, minute, second, millisecond, microsecond);
    while (result.month != month) {
      result = result.subtract(const Duration(days: 1));
    }
    return result;
  }

  int dayCountInThisMonth() {
    final lastDayOfThisMonth = DateTime(year, month + 1, 0);
    return lastDayOfThisMonth.day;
  }

  String formatToDTOString({bool useZForUTC = true}) {
    final timeZone = timeZoneString(useZForUTC: useZForUTC);
    if (isUtc) {
      return toIso8601String().replaceAll('Z', timeZone);
    } else {
      return '${toIso8601String()}$timeZone';
    }
  }

  String formatToShortDateDisplay() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String formatToShortDateStorage() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatToShortDateTimeDisplay() {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(this);
  }

  String formatToShortDateTimeStorage() {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(this);
  }
}
