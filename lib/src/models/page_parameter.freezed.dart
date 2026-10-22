// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageParameter {


/// Create a copy of PageParameter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageParameterCopyWith<PageParameter> get copyWith => _$PageParameterCopyWithImpl<PageParameter>(this as PageParameter, _$identity);





@override
String toString() {
  final _this = this as PageParameter;
  return 'PageParameter(routeName: ${_this.routeName}, initialLifecycleState: ${_this.initialLifecycleState}, initialTitle: ${_this.initialTitle})';
}


}

/// @nodoc
abstract mixin class $PageParameterCopyWith<$Res>  {
  factory $PageParameterCopyWith(PageParameter value, $Res Function(PageParameter) _then) = _$PageParameterCopyWithImpl;
@useResult
$Res call({
 String routeName, PageLifecycleState initialLifecycleState, String? initialTitle
});




}
/// @nodoc
class _$PageParameterCopyWithImpl<$Res>
    implements $PageParameterCopyWith<$Res> {
  _$PageParameterCopyWithImpl(this._self, this._then);

  final PageParameter _self;
  final $Res Function(PageParameter) _then;

/// Create a copy of PageParameter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routeName = null,Object? initialLifecycleState = null,Object? initialTitle = freezed,}) {
  return _then(PageParameter(
routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,initialLifecycleState: null == initialLifecycleState ? _self.initialLifecycleState : initialLifecycleState // ignore: cast_nullable_to_non_nullable
as PageLifecycleState,initialTitle: freezed == initialTitle ? _self.initialTitle : initialTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}



// dart format on
