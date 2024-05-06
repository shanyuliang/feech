// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraMeta {
  List<CameraDescription>? get cameraDescriptions =>
      throw _privateConstructorUsedError;
  CameraDescription? get selectedCameraDescription =>
      throw _privateConstructorUsedError;
  CameraController? get selectedCameraController =>
      throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraMetaCopyWith<CameraMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraMetaCopyWith<$Res> {
  factory $CameraMetaCopyWith(
          CameraMeta value, $Res Function(CameraMeta) then) =
      _$CameraMetaCopyWithImpl<$Res, CameraMeta>;
  @useResult
  $Res call(
      {List<CameraDescription>? cameraDescriptions,
      CameraDescription? selectedCameraDescription,
      CameraController? selectedCameraController,
      String? imagePath,
      StateStatus stateStatus});
}

/// @nodoc
class _$CameraMetaCopyWithImpl<$Res, $Val extends CameraMeta>
    implements $CameraMetaCopyWith<$Res> {
  _$CameraMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraDescriptions = freezed,
    Object? selectedCameraDescription = freezed,
    Object? selectedCameraController = freezed,
    Object? imagePath = freezed,
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      cameraDescriptions: freezed == cameraDescriptions
          ? _value.cameraDescriptions
          : cameraDescriptions // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>?,
      selectedCameraDescription: freezed == selectedCameraDescription
          ? _value.selectedCameraDescription
          : selectedCameraDescription // ignore: cast_nullable_to_non_nullable
              as CameraDescription?,
      selectedCameraController: freezed == selectedCameraController
          ? _value.selectedCameraController
          : selectedCameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraMetaImplCopyWith<$Res>
    implements $CameraMetaCopyWith<$Res> {
  factory _$$CameraMetaImplCopyWith(
          _$CameraMetaImpl value, $Res Function(_$CameraMetaImpl) then) =
      __$$CameraMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CameraDescription>? cameraDescriptions,
      CameraDescription? selectedCameraDescription,
      CameraController? selectedCameraController,
      String? imagePath,
      StateStatus stateStatus});
}

/// @nodoc
class __$$CameraMetaImplCopyWithImpl<$Res>
    extends _$CameraMetaCopyWithImpl<$Res, _$CameraMetaImpl>
    implements _$$CameraMetaImplCopyWith<$Res> {
  __$$CameraMetaImplCopyWithImpl(
      _$CameraMetaImpl _value, $Res Function(_$CameraMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraDescriptions = freezed,
    Object? selectedCameraDescription = freezed,
    Object? selectedCameraController = freezed,
    Object? imagePath = freezed,
    Object? stateStatus = null,
  }) {
    return _then(_$CameraMetaImpl(
      cameraDescriptions: freezed == cameraDescriptions
          ? _value._cameraDescriptions
          : cameraDescriptions // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>?,
      selectedCameraDescription: freezed == selectedCameraDescription
          ? _value.selectedCameraDescription
          : selectedCameraDescription // ignore: cast_nullable_to_non_nullable
              as CameraDescription?,
      selectedCameraController: freezed == selectedCameraController
          ? _value.selectedCameraController
          : selectedCameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$CameraMetaImpl implements _CameraMeta {
  const _$CameraMetaImpl(
      {final List<CameraDescription>? cameraDescriptions,
      this.selectedCameraDescription,
      this.selectedCameraController,
      this.imagePath,
      this.stateStatus = StateStatus.initial})
      : _cameraDescriptions = cameraDescriptions;

  final List<CameraDescription>? _cameraDescriptions;
  @override
  List<CameraDescription>? get cameraDescriptions {
    final value = _cameraDescriptions;
    if (value == null) return null;
    if (_cameraDescriptions is EqualUnmodifiableListView)
      return _cameraDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CameraDescription? selectedCameraDescription;
  @override
  final CameraController? selectedCameraController;
  @override
  final String? imagePath;
  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'CameraMeta(cameraDescriptions: $cameraDescriptions, selectedCameraDescription: $selectedCameraDescription, selectedCameraController: $selectedCameraController, imagePath: $imagePath, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraMetaImpl &&
            const DeepCollectionEquality()
                .equals(other._cameraDescriptions, _cameraDescriptions) &&
            (identical(other.selectedCameraDescription,
                    selectedCameraDescription) ||
                other.selectedCameraDescription == selectedCameraDescription) &&
            (identical(
                    other.selectedCameraController, selectedCameraController) ||
                other.selectedCameraController == selectedCameraController) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cameraDescriptions),
      selectedCameraDescription,
      selectedCameraController,
      imagePath,
      stateStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraMetaImplCopyWith<_$CameraMetaImpl> get copyWith =>
      __$$CameraMetaImplCopyWithImpl<_$CameraMetaImpl>(this, _$identity);
}

abstract class _CameraMeta implements CameraMeta {
  const factory _CameraMeta(
      {final List<CameraDescription>? cameraDescriptions,
      final CameraDescription? selectedCameraDescription,
      final CameraController? selectedCameraController,
      final String? imagePath,
      final StateStatus stateStatus}) = _$CameraMetaImpl;

  @override
  List<CameraDescription>? get cameraDescriptions;
  @override
  CameraDescription? get selectedCameraDescription;
  @override
  CameraController? get selectedCameraController;
  @override
  String? get imagePath;
  @override
  StateStatus get stateStatus;
  @override
  @JsonKey(ignore: true)
  _$$CameraMetaImplCopyWith<_$CameraMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
