import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class JsonConverterEx<T, S> implements JsonConverter<T, S> {
  const JsonConverterEx();

  FutureOr<T> fromJsonEx(S json) async {
    return await compute(fromJson, json);
  }

  FutureOr<S> toJsonEx(T object) async {
    return await compute(toJson, object);
  }
}
