// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_web_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppWebViewState {

 int? get id; TextEditingController get urlEditorController; String? get initialUrl; String? get title; int? get progress; String? get pageStarted; String? get pageFinished; String? get currentUrl; String? get errorMessage; AppJavaScriptMessage? get javaScriptMessage; AppNavigationDecision? get navigationDecision; bool get canGoBack; bool get canGoForward; bool get expandTitleBar; StateStatus get stateStatus;
/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppWebViewStateCopyWith<AppWebViewState> get copyWith => _$AppWebViewStateCopyWithImpl<AppWebViewState>(this as AppWebViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppWebViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.urlEditorController, urlEditorController) || other.urlEditorController == urlEditorController)&&(identical(other.initialUrl, initialUrl) || other.initialUrl == initialUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.pageStarted, pageStarted) || other.pageStarted == pageStarted)&&(identical(other.pageFinished, pageFinished) || other.pageFinished == pageFinished)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.javaScriptMessage, javaScriptMessage) || other.javaScriptMessage == javaScriptMessage)&&(identical(other.navigationDecision, navigationDecision) || other.navigationDecision == navigationDecision)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.expandTitleBar, expandTitleBar) || other.expandTitleBar == expandTitleBar)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,urlEditorController,initialUrl,title,progress,pageStarted,pageFinished,currentUrl,errorMessage,javaScriptMessage,navigationDecision,canGoBack,canGoForward,expandTitleBar,stateStatus);

@override
String toString() {
  return 'AppWebViewState(id: $id, urlEditorController: $urlEditorController, initialUrl: $initialUrl, title: $title, progress: $progress, pageStarted: $pageStarted, pageFinished: $pageFinished, currentUrl: $currentUrl, errorMessage: $errorMessage, javaScriptMessage: $javaScriptMessage, navigationDecision: $navigationDecision, canGoBack: $canGoBack, canGoForward: $canGoForward, expandTitleBar: $expandTitleBar, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class $AppWebViewStateCopyWith<$Res>  {
  factory $AppWebViewStateCopyWith(AppWebViewState value, $Res Function(AppWebViewState) _then) = _$AppWebViewStateCopyWithImpl;
@useResult
$Res call({
 int? id, TextEditingController urlEditorController, String? initialUrl, String? title, int? progress, String? pageStarted, String? pageFinished, String? currentUrl, String? errorMessage, ({String channel, String message})? javaScriptMessage, ({bool allowed, bool isMainFrame, String url})? navigationDecision, bool canGoBack, bool canGoForward, bool expandTitleBar, StateStatus stateStatus
});




}
/// @nodoc
class _$AppWebViewStateCopyWithImpl<$Res>
    implements $AppWebViewStateCopyWith<$Res> {
  _$AppWebViewStateCopyWithImpl(this._self, this._then);

  final AppWebViewState _self;
  final $Res Function(AppWebViewState) _then;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? urlEditorController = null,Object? initialUrl = freezed,Object? title = freezed,Object? progress = freezed,Object? pageStarted = freezed,Object? pageFinished = freezed,Object? currentUrl = freezed,Object? errorMessage = freezed,Object? javaScriptMessage = freezed,Object? navigationDecision = freezed,Object? canGoBack = null,Object? canGoForward = null,Object? expandTitleBar = null,Object? stateStatus = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,urlEditorController: null == urlEditorController ? _self.urlEditorController : urlEditorController // ignore: cast_nullable_to_non_nullable
as TextEditingController,initialUrl: freezed == initialUrl ? _self.initialUrl : initialUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,pageStarted: freezed == pageStarted ? _self.pageStarted : pageStarted // ignore: cast_nullable_to_non_nullable
as String?,pageFinished: freezed == pageFinished ? _self.pageFinished : pageFinished // ignore: cast_nullable_to_non_nullable
as String?,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,javaScriptMessage: freezed == javaScriptMessage ? _self.javaScriptMessage! : javaScriptMessage // ignore: cast_nullable_to_non_nullable
as ({String channel, String message})?,navigationDecision: freezed == navigationDecision ? _self.navigationDecision! : navigationDecision // ignore: cast_nullable_to_non_nullable
as ({bool allowed, bool isMainFrame, String url})?,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,expandTitleBar: null == expandTitleBar ? _self.expandTitleBar : expandTitleBar // ignore: cast_nullable_to_non_nullable
as bool,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}

}


/// @nodoc


class _AppWebViewState implements AppWebViewState {
  const _AppWebViewState({required this.id, required this.urlEditorController, this.initialUrl, this.title, this.progress, this.pageStarted, this.pageFinished, this.currentUrl, this.errorMessage, this.javaScriptMessage, this.navigationDecision, this.canGoBack = false, this.canGoForward = false, this.expandTitleBar = false, this.stateStatus = StateStatus.initial});
  

@override final  int? id;
@override final  TextEditingController urlEditorController;
@override final  String? initialUrl;
@override final  String? title;
@override final  int? progress;
@override final  String? pageStarted;
@override final  String? pageFinished;
@override final  String? currentUrl;
@override final  String? errorMessage;
@override final  ({String channel, String message})? javaScriptMessage;
@override final  ({bool allowed, bool isMainFrame, String url})? navigationDecision;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;
@override@JsonKey() final  bool expandTitleBar;
@override@JsonKey() final  StateStatus stateStatus;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppWebViewStateCopyWith<_AppWebViewState> get copyWith => __$AppWebViewStateCopyWithImpl<_AppWebViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppWebViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.urlEditorController, urlEditorController) || other.urlEditorController == urlEditorController)&&(identical(other.initialUrl, initialUrl) || other.initialUrl == initialUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.pageStarted, pageStarted) || other.pageStarted == pageStarted)&&(identical(other.pageFinished, pageFinished) || other.pageFinished == pageFinished)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.javaScriptMessage, javaScriptMessage) || other.javaScriptMessage == javaScriptMessage)&&(identical(other.navigationDecision, navigationDecision) || other.navigationDecision == navigationDecision)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.expandTitleBar, expandTitleBar) || other.expandTitleBar == expandTitleBar)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,urlEditorController,initialUrl,title,progress,pageStarted,pageFinished,currentUrl,errorMessage,javaScriptMessage,navigationDecision,canGoBack,canGoForward,expandTitleBar,stateStatus);

@override
String toString() {
  return 'AppWebViewState(id: $id, urlEditorController: $urlEditorController, initialUrl: $initialUrl, title: $title, progress: $progress, pageStarted: $pageStarted, pageFinished: $pageFinished, currentUrl: $currentUrl, errorMessage: $errorMessage, javaScriptMessage: $javaScriptMessage, navigationDecision: $navigationDecision, canGoBack: $canGoBack, canGoForward: $canGoForward, expandTitleBar: $expandTitleBar, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class _$AppWebViewStateCopyWith<$Res> implements $AppWebViewStateCopyWith<$Res> {
  factory _$AppWebViewStateCopyWith(_AppWebViewState value, $Res Function(_AppWebViewState) _then) = __$AppWebViewStateCopyWithImpl;
@override @useResult
$Res call({
 int? id, TextEditingController urlEditorController, String? initialUrl, String? title, int? progress, String? pageStarted, String? pageFinished, String? currentUrl, String? errorMessage, ({String channel, String message})? javaScriptMessage, ({bool allowed, bool isMainFrame, String url})? navigationDecision, bool canGoBack, bool canGoForward, bool expandTitleBar, StateStatus stateStatus
});




}
/// @nodoc
class __$AppWebViewStateCopyWithImpl<$Res>
    implements _$AppWebViewStateCopyWith<$Res> {
  __$AppWebViewStateCopyWithImpl(this._self, this._then);

  final _AppWebViewState _self;
  final $Res Function(_AppWebViewState) _then;

/// Create a copy of AppWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? urlEditorController = null,Object? initialUrl = freezed,Object? title = freezed,Object? progress = freezed,Object? pageStarted = freezed,Object? pageFinished = freezed,Object? currentUrl = freezed,Object? errorMessage = freezed,Object? javaScriptMessage = freezed,Object? navigationDecision = freezed,Object? canGoBack = null,Object? canGoForward = null,Object? expandTitleBar = null,Object? stateStatus = null,}) {
  return _then(_AppWebViewState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,urlEditorController: null == urlEditorController ? _self.urlEditorController : urlEditorController // ignore: cast_nullable_to_non_nullable
as TextEditingController,initialUrl: freezed == initialUrl ? _self.initialUrl : initialUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,pageStarted: freezed == pageStarted ? _self.pageStarted : pageStarted // ignore: cast_nullable_to_non_nullable
as String?,pageFinished: freezed == pageFinished ? _self.pageFinished : pageFinished // ignore: cast_nullable_to_non_nullable
as String?,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,javaScriptMessage: freezed == javaScriptMessage ? _self.javaScriptMessage : javaScriptMessage // ignore: cast_nullable_to_non_nullable
as ({String channel, String message})?,navigationDecision: freezed == navigationDecision ? _self.navigationDecision : navigationDecision // ignore: cast_nullable_to_non_nullable
as ({bool allowed, bool isMainFrame, String url})?,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,expandTitleBar: null == expandTitleBar ? _self.expandTitleBar : expandTitleBar // ignore: cast_nullable_to_non_nullable
as bool,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}


}

// dart format on
