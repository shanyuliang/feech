class CancellationException implements Exception {
  @pragma("vm:entry-point")
  const CancellationException([this.message = 'Operation is cancelled.']);

  final String message;

  @override
  String toString() => "Exception: $message";
}
