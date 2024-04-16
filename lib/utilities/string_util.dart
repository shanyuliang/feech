import 'dart:math';

String randomString(int len) {
  final random = Random();
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => chars[random.nextInt(chars.length)]).join();
}

String randomStringIncludeSpecialCharacters(int len) {
  final random = Random();
  return String.fromCharCodes(List.generate(len, (index) => random.nextInt(33) + 89));
}
