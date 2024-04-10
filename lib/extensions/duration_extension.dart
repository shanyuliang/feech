extension DurationExtension on Duration {
  String toDisplay() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(inHours);
    String twoDigitMinutes =
        twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        twoDigits(inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String toReadable(String zeroText) {
    if (inHours > 1) {
      return "$inHours hrs ${inMinutes.remainder(Duration.minutesPerHour)} mins";
    } else if (inHours > 0) {
      return "$inHours hr ${inMinutes.remainder(Duration.minutesPerHour)} mins";
    } else if (inMinutes > 0) {
      return "$inMinutes mins";
    } else if (inSeconds > 0) {
      return "$inSeconds secs";
    } else {
      return zeroText;
    }
  }
}
