// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runtime_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RuntimeInfo {


/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuntimeInfoCopyWith<RuntimeInfo> get copyWith => _$RuntimeInfoCopyWithImpl<RuntimeInfo>(this as RuntimeInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RuntimeInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuntimeInfo&&(identical(other.appLifecycleState, _this.appLifecycleState) || other.appLifecycleState == _this.appLifecycleState)&&(identical(other.brightness, _this.brightness) || other.brightness == _this.brightness)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.textScaleFactor, _this.textScaleFactor) || other.textScaleFactor == _this.textScaleFactor)&&(identical(other.devicePixelRatio, _this.devicePixelRatio) || other.devicePixelRatio == _this.devicePixelRatio)&&(identical(other.physicalDisplaySize, _this.physicalDisplaySize) || other.physicalDisplaySize == _this.physicalDisplaySize)&&(identical(other.logicalDisplaySize, _this.logicalDisplaySize) || other.logicalDisplaySize == _this.logicalDisplaySize)&&(identical(other.displayWidthMode, _this.displayWidthMode) || other.displayWidthMode == _this.displayWidthMode));
}


@override
int get hashCode {
  final _this = this as RuntimeInfo;
  return Object.hash(runtimeType,_this.appLifecycleState,_this.brightness,_this.locale,_this.textScaleFactor,_this.devicePixelRatio,_this.physicalDisplaySize,_this.logicalDisplaySize,_this.displayWidthMode);
}

@override
String toString() {
  final _this = this as RuntimeInfo;
  return 'RuntimeInfo(appLifecycleState: ${_this.appLifecycleState}, brightness: ${_this.brightness}, locale: ${_this.locale}, textScaleFactor: ${_this.textScaleFactor}, devicePixelRatio: ${_this.devicePixelRatio}, physicalDisplaySize: ${_this.physicalDisplaySize}, logicalDisplaySize: ${_this.logicalDisplaySize}, displayWidthMode: ${_this.displayWidthMode})';
}


}

/// @nodoc
abstract mixin class $RuntimeInfoCopyWith<$Res>  {
  factory $RuntimeInfoCopyWith(RuntimeInfo value, $Res Function(RuntimeInfo) _then) = _$RuntimeInfoCopyWithImpl;
@useResult
$Res call({
 AppLifecycleState? appLifecycleState, Brightness brightness, Locale locale, double textScaleFactor, double devicePixelRatio, Size physicalDisplaySize, Size logicalDisplaySize, DisplayWidthMode displayWidthMode
});




}
/// @nodoc
class _$RuntimeInfoCopyWithImpl<$Res>
    implements $RuntimeInfoCopyWith<$Res> {
  _$RuntimeInfoCopyWithImpl(this._self, this._then);

  final RuntimeInfo _self;
  final $Res Function(RuntimeInfo) _then;

/// Create a copy of RuntimeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appLifecycleState = freezed,Object? brightness = null,Object? locale = null,Object? textScaleFactor = null,Object? devicePixelRatio = null,Object? physicalDisplaySize = null,Object? logicalDisplaySize = null,Object? displayWidthMode = null,}) {
  return _then(RuntimeInfo(
appLifecycleState: freezed == appLifecycleState ? _self.appLifecycleState : appLifecycleState // ignore: cast_nullable_to_non_nullable
as AppLifecycleState?,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,textScaleFactor: null == textScaleFactor ? _self.textScaleFactor : textScaleFactor // ignore: cast_nullable_to_non_nullable
as double,devicePixelRatio: null == devicePixelRatio ? _self.devicePixelRatio : devicePixelRatio // ignore: cast_nullable_to_non_nullable
as double,physicalDisplaySize: null == physicalDisplaySize ? _self.physicalDisplaySize : physicalDisplaySize // ignore: cast_nullable_to_non_nullable
as Size,logicalDisplaySize: null == logicalDisplaySize ? _self.logicalDisplaySize : logicalDisplaySize // ignore: cast_nullable_to_non_nullable
as Size,displayWidthMode: null == displayWidthMode ? _self.displayWidthMode : displayWidthMode // ignore: cast_nullable_to_non_nullable
as DisplayWidthMode,
  ));
}

}



// dart format on
