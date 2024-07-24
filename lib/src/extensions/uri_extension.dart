extension UriExtension on Uri {
  /// Append extra query parameters to this uri.
  /// Example usage:
  /// appendQueryParameters(
  ///       extraQueryParameters: {
  ///         "user_anonymous_id": ["XXXXXXXX", "YYYYYYYY", null, ""],
  ///       },
  ///     );
  Uri appendQueryParameters({
    required Map<String, List<String?>> extraQueryParameters,
    bool overwrittenSameKey = true,
    bool removeNullValue = true,
    bool removeEmptyValue = false,
  }) {
    final fullQueryParameters = <String, List<String?>>{};
    fullQueryParameters.addAll(queryParametersAll);
    final adjustedExtraQueryParameters = _adjustParameters(
      parameters: extraQueryParameters,
      removeNullValue: removeNullValue,
      removeEmptyValue: removeEmptyValue,
    );
    if (overwrittenSameKey) {
      fullQueryParameters.addAll(adjustedExtraQueryParameters);
    } else {
      adjustedExtraQueryParameters.forEach((key, value) {
        if (!fullQueryParameters.containsKey(key)) {
          fullQueryParameters[key] = value;
        }
      });
    }
    return replace(queryParameters: fullQueryParameters);
  }

  Map<String, List<String?>> _adjustParameters({
    required Map<String, List<String?>> parameters,
    required bool removeNullValue,
    required bool removeEmptyValue,
  }) {
    final returnedParameters = <String, List<String?>>{};
    if (removeNullValue || removeEmptyValue) {
      parameters.forEach((key, value) {
        final mutableValue = value.toList();
        if (removeNullValue) {
          mutableValue.removeWhere((element) => element == null);
        }
        if (removeEmptyValue) {
          mutableValue.removeWhere((element) => element?.isEmpty ?? false);
        }
        if (mutableValue.isNotEmpty) {
          returnedParameters[key] = mutableValue;
        }
      });
    } else {
      returnedParameters.addAll(parameters);
    }
    return returnedParameters;
  }

  Uri insertLastPathSegment({final String? insertedPathSegment}) {
    if (insertedPathSegment != null) {
      final originalPathSegments = pathSegments.toList();
      return replace(pathSegments: originalPathSegments..insert(originalPathSegments.length - 1, insertedPathSegment));
    } else {
      return this;
    }
  }
}
