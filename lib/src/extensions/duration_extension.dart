extension DurationExtension on Duration {
  String toDisplay() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(inHours);
    String twoDigitMinutes = twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  /// granularity
  /// 0: microseconds
  /// 1: milliseconds
  /// 2: seconds
  /// 3: minutes
  /// 4: hours
  /// 5: days
  String toReadable({String zeroText = "", int granularity = 0}) {
    if (this == Duration.zero) {
      return zeroText;
    } else {
      final actionDuration = switch (granularity) {
        0 => Duration(microseconds: inMicroseconds),
        1 => Duration(milliseconds: inMilliseconds),
        2 => Duration(seconds: inSeconds),
        3 => Duration(minutes: inMinutes),
        4 => Duration(hours: inHours),
        _ => Duration(days: inDays),
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

      return "$dayText $hourText $minuteText $secondText $millisecondText $microsecondText".trim();
    }
  }
}
