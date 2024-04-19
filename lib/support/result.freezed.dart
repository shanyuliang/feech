// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Success<T> {
  T get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res, Success<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res, $Val extends Success<T>>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$SuccessCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> extends _Success<T> {
  const _$SuccessImpl({required this.data}) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'Success<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);
}

abstract class _Success<T> extends Success<T> {
  const factory _Success({required final T data}) = _$SuccessImpl<T>;
  const _Success._() : super._();

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Failure<T> {
  Object? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res, Failure<T>>;
  @useResult
  $Res call({Object? error, String? message});
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res, $Val extends Failure<T>>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error ? _value.error : error,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({Object? error, String? message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$FailureImpl<T>(
      error: freezed == error ? _value.error : error,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> extends _Failure<T> {
  const _$FailureImpl({this.error, this.message}) : super._();

  @override
  final Object? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'Failure<$T>(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);
}

abstract class _Failure<T> extends Failure<T> {
  const factory _Failure({final Object? error, final String? message}) =
      _$FailureImpl<T>;
  const _Failure._() : super._();

  @override
  Object? get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Cancellation<T> {
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CancellationCopyWith<T, Cancellation<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancellationCopyWith<T, $Res> {
  factory $CancellationCopyWith(
          Cancellation<T> value, $Res Function(Cancellation<T>) then) =
      _$CancellationCopyWithImpl<T, $Res, Cancellation<T>>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$CancellationCopyWithImpl<T, $Res, $Val extends Cancellation<T>>
    implements $CancellationCopyWith<T, $Res> {
  _$CancellationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancellationImplCopyWith<T, $Res>
    implements $CancellationCopyWith<T, $Res> {
  factory _$$CancellationImplCopyWith(_$CancellationImpl<T> value,
          $Res Function(_$CancellationImpl<T>) then) =
      __$$CancellationImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CancellationImplCopyWithImpl<T, $Res>
    extends _$CancellationCopyWithImpl<T, $Res, _$CancellationImpl<T>>
    implements _$$CancellationImplCopyWith<T, $Res> {
  __$$CancellationImplCopyWithImpl(
      _$CancellationImpl<T> _value, $Res Function(_$CancellationImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CancellationImpl<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CancellationImpl<T> extends _Cancellation<T> {
  const _$CancellationImpl({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'Cancellation<$T>(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancellationImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancellationImplCopyWith<T, _$CancellationImpl<T>> get copyWith =>
      __$$CancellationImplCopyWithImpl<T, _$CancellationImpl<T>>(
          this, _$identity);
}

abstract class _Cancellation<T> extends Cancellation<T> {
  const factory _Cancellation({final String? message}) = _$CancellationImpl<T>;
  const _Cancellation._() : super._();

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$CancellationImplCopyWith<T, _$CancellationImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
