import 'dart:convert';

extension DynamicExtension on dynamic {
  static const encoder = JsonEncoder.withIndent(null);

  String stringify() {
    final finalObject = this is Function ? this() : this;
    if (finalObject is Map || finalObject is Iterable) {
      return encoder.convert(finalObject);
    } else {
      return finalObject.toString();
    }
  }
}
