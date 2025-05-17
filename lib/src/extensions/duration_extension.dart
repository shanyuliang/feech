import '../models/time_granularity.dart';

extension DurationExtension on Duration {
  String toDisplay() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(inHours);
    String twoDigitMinutes = twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String toReadable({String zeroText = "", bool removeZeroValueGranularity = false, TimeGranularity timeGranularity = TimeGranularity.microseconds}) {
    if (this == Duration.zero) {
      return zeroText;
    } else {
      final actionDuration = switch (timeGranularity) {
        TimeGranularity.microseconds => Duration(microseconds: inMicroseconds),
        TimeGranularity.milliseconds => Duration(milliseconds: inMilliseconds),
        TimeGranularity.seconds => Duration(seconds: inSeconds),
        TimeGranularity.minutes => Duration(minutes: inMinutes),
        TimeGranularity.hours => Duration(hours: inHours),
        TimeGranularity.days => Duration(days: inDays),
      };

      final dayCount = actionDuration.inDays;
      final hourCount = actionDuration.inHours.remainder(Duration.hoursPerDay);
      final minuteCount = actionDuration.inMinutes.remainder(Duration.minutesPerHour);
      final secondCount = actionDuration.inSeconds.remainder(Duration.secondsPerMinute);
      final millisecondCount = actionDuration.inMilliseconds.remainder(Duration.millisecondsPerSecond);
      final microsecondCount = actionDuration.inMicroseconds.remainder(Duration.microsecondsPerMillisecond);

      final dayText = dayCount > 1 ? "$dayCount days" : (dayCount == 1 ? "$dayCount day" : "");
      final hourText = hourCount > 1 ? "$hourCount hrs" : (hourCount == 1 ? "$hourCount hr" : "");
      final minuteText = minuteCount > 1 ? "$minuteCount mins" : (minuteCount == 1 ? "$minuteCount min" : "");
      final secondText = secondCount > 1 ? "$secondCount secs" : (secondCount == 1 ? "$secondCount sec" : "");
      final millisecondText = millisecondCount > 1 ? "$millisecondCount ms" : (millisecondCount == 1 ? "$millisecondCount ms" : "");
      final microsecondText = microsecondCount > 1 ? "$microsecondCount μs" : (microsecondCount == 1 ? "$microsecondCount μs" : "");

      return "$dayText $hourText $minuteText $secondText $millisecondText $microsecondText".replaceAll(RegExp(r'\s+'), ' ').trim();
    }
  }
}
