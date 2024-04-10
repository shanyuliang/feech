extension IterableExtention<T> on Iterable<T> {
  T? firstOrNull() => isEmpty ? null : first;

  T? lastOrNull() => isEmpty ? null : last;

  T? firstWhereOrNull(bool Function(T element) test) {
    for (T element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  T? lastWhereOrNull(bool Function(T element) test) {
    late T result;
    bool foundMatching = false;
    for (T element in this) {
      if (test(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    return null;
  }
}
