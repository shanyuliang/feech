import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class JsonConverterEx<T, S> implements JsonConverter<T, S> {
  const JsonConverterEx();

  Future<T> fromJsonEx(S json) async {
    return await compute(fromJson, json);
  }

  Future<S> toJsonEx(T object) async {
    return await compute(toJson, object);
  }
}
