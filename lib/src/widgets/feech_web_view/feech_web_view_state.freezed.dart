// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feech_web_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeechWebViewState {

 int? get id; TextEditingController get urlEditorController; WebViewController get webViewController; String? get initialUrl; String? get title; int? get progress; String? get pageStarted; String? get pageFinished; String? get currentUrl; String? get errorMessage; AppJavaScriptMessage? get javaScriptMessage; AppNavigationDecision? get navigationDecision; bool get canGoBack; bool get canGoForward; bool get expandTitleBar; bool get showDebugToolbar; List<String?> get historyUrls; Map<String?, dynamic> get localStorageItems; Map<String?, dynamic> get sessionStorageItems; StateStatus get stateStatus;
/// Create a copy of FeechWebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeechWebViewStateCopyWith<FeechWebViewState> get copyWith => _$FeechWebViewStateCopyWithImpl<FeechWebViewState>(this as FeechWebViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeechWebViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.urlEditorController, urlEditorController) || other.urlEditorController == urlEditorController)&&(identical(other.webViewController, webViewController) || other.webViewController == webViewController)&&(identical(other.initialUrl, initialUrl) || other.initialUrl == initialUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.pageStarted, pageStarted) || other.pageStarted == pageStarted)&&(identical(other.pageFinished, pageFinished) || other.pageFinished == pageFinished)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.javaScriptMessage, javaScriptMessage) || other.javaScriptMessage == javaScriptMessage)&&(identical(other.navigationDecision, navigationDecision) || other.navigationDecision == navigationDecision)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.expandTitleBar, expandTitleBar) || other.expandTitleBar == expandTitleBar)&&(identical(other.showDebugToolbar, showDebugToolbar) || other.showDebugToolbar == showDebugToolbar)&&const DeepCollectionEquality().equals(other.historyUrls, historyUrls)&&const DeepCollectionEquality().equals(other.localStorageItems, localStorageItems)&&const DeepCollectionEquality().equals(other.sessionStorageItems, sessionStorageItems)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,urlEditorController,webViewController,initialUrl,title,progress,pageStarted,pageFinished,currentUrl,errorMessage,javaScriptMessage,navigationDecision,canGoBack,canGoForward,expandTitleBar,showDebugToolbar,const DeepCollectionEquality().hash(historyUrls),const DeepCollectionEquality().hash(localStorageItems),const DeepCollectionEquality().hash(sessionStorageItems),stateStatus]);

@override
String toString() {
  return 'FeechWebViewState(id: $id, urlEditorController: $urlEditorController, webViewController: $webViewController, initialUrl: $initialUrl, title: $title, progress: $progress, pageStarted: $pageStarted, pageFinished: $pageFinished, currentUrl: $currentUrl, errorMessage: $errorMessage, javaScriptMessage: $javaScriptMessage, navigationDecision: $navigationDecision, canGoBack: $canGoBack, canGoForward: $canGoForward, expandTitleBar: $expandTitleBar, showDebugToolbar: $showDebugToolbar, historyUrls: $historyUrls, localStorageItems: $localStorageItems, sessionStorageItems: $sessionStorageItems, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class $FeechWebViewStateCopyWith<$Res>  {
  factory $FeechWebViewStateCopyWith(FeechWebViewState value, $Res Function(FeechWebViewState) _then) = _$FeechWebViewStateCopyWithImpl;
@useResult
$Res call({
 int? id, TextEditingController urlEditorController, WebViewController webViewController, String? initialUrl, String? title, int? progress, String? pageStarted, String? pageFinished, String? currentUrl, String? errorMessage, AppJavaScriptMessage? javaScriptMessage, AppNavigationDecision? navigationDecision, bool canGoBack, bool canGoForward, bool expandTitleBar, bool showDebugToolbar, List<String?> historyUrls, Map<String?, dynamic> localStorageItems, Map<String?, dynamic> sessionStorageItems, StateStatus stateStatus
});




}
/// @nodoc
class _$FeechWebViewStateCopyWithImpl<$Res>
    implements $FeechWebViewStateCopyWith<$Res> {
  _$FeechWebViewStateCopyWithImpl(this._self, this._then);

  final FeechWebViewState _self;
  final $Res Function(FeechWebViewState) _then;

/// Create a copy of FeechWebViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? urlEditorController = null,Object? webViewController = null,Object? initialUrl = freezed,Object? title = freezed,Object? progress = freezed,Object? pageStarted = freezed,Object? pageFinished = freezed,Object? currentUrl = freezed,Object? errorMessage = freezed,Object? javaScriptMessage = freezed,Object? navigationDecision = freezed,Object? canGoBack = null,Object? canGoForward = null,Object? expandTitleBar = null,Object? showDebugToolbar = null,Object? historyUrls = null,Object? localStorageItems = null,Object? sessionStorageItems = null,Object? stateStatus = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,urlEditorController: null == urlEditorController ? _self.urlEditorController : urlEditorController // ignore: cast_nullable_to_non_nullable
as TextEditingController,webViewController: null == webViewController ? _self.webViewController : webViewController // ignore: cast_nullable_to_non_nullable
as WebViewController,initialUrl: freezed == initialUrl ? _self.initialUrl : initialUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,pageStarted: freezed == pageStarted ? _self.pageStarted : pageStarted // ignore: cast_nullable_to_non_nullable
as String?,pageFinished: freezed == pageFinished ? _self.pageFinished : pageFinished // ignore: cast_nullable_to_non_nullable
as String?,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,javaScriptMessage: freezed == javaScriptMessage ? _self.javaScriptMessage : javaScriptMessage // ignore: cast_nullable_to_non_nullable
as AppJavaScriptMessage?,navigationDecision: freezed == navigationDecision ? _self.navigationDecision : navigationDecision // ignore: cast_nullable_to_non_nullable
as AppNavigationDecision?,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,expandTitleBar: null == expandTitleBar ? _self.expandTitleBar : expandTitleBar // ignore: cast_nullable_to_non_nullable
as bool,showDebugToolbar: null == showDebugToolbar ? _self.showDebugToolbar : showDebugToolbar // ignore: cast_nullable_to_non_nullable
as bool,historyUrls: null == historyUrls ? _self.historyUrls : historyUrls // ignore: cast_nullable_to_non_nullable
as List<String?>,localStorageItems: null == localStorageItems ? _self.localStorageItems : localStorageItems // ignore: cast_nullable_to_non_nullable
as Map<String?, dynamic>,sessionStorageItems: null == sessionStorageItems ? _self.sessionStorageItems : sessionStorageItems // ignore: cast_nullable_to_non_nullable
as Map<String?, dynamic>,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [FeechWebViewState].
extension FeechWebViewStatePatterns on FeechWebViewState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeechWebViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeechWebViewState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeechWebViewState value)  $default,){
final _that = this;
switch (_that) {
case _FeechWebViewState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeechWebViewState value)?  $default,){
final _that = this;
switch (_that) {
case _FeechWebViewState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  TextEditingController urlEditorController,  WebViewController webViewController,  String? initialUrl,  String? title,  int? progress,  String? pageStarted,  String? pageFinished,  String? currentUrl,  String? errorMessage,  AppJavaScriptMessage? javaScriptMessage,  AppNavigationDecision? navigationDecision,  bool canGoBack,  bool canGoForward,  bool expandTitleBar,  bool showDebugToolbar,  List<String?> historyUrls,  Map<String?, dynamic> localStorageItems,  Map<String?, dynamic> sessionStorageItems,  StateStatus stateStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeechWebViewState() when $default != null:
return $default(_that.id,_that.urlEditorController,_that.webViewController,_that.initialUrl,_that.title,_that.progress,_that.pageStarted,_that.pageFinished,_that.currentUrl,_that.errorMessage,_that.javaScriptMessage,_that.navigationDecision,_that.canGoBack,_that.canGoForward,_that.expandTitleBar,_that.showDebugToolbar,_that.historyUrls,_that.localStorageItems,_that.sessionStorageItems,_that.stateStatus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  TextEditingController urlEditorController,  WebViewController webViewController,  String? initialUrl,  String? title,  int? progress,  String? pageStarted,  String? pageFinished,  String? currentUrl,  String? errorMessage,  AppJavaScriptMessage? javaScriptMessage,  AppNavigationDecision? navigationDecision,  bool canGoBack,  bool canGoForward,  bool expandTitleBar,  bool showDebugToolbar,  List<String?> historyUrls,  Map<String?, dynamic> localStorageItems,  Map<String?, dynamic> sessionStorageItems,  StateStatus stateStatus)  $default,) {final _that = this;
switch (_that) {
case _FeechWebViewState():
return $default(_that.id,_that.urlEditorController,_that.webViewController,_that.initialUrl,_that.title,_that.progress,_that.pageStarted,_that.pageFinished,_that.currentUrl,_that.errorMessage,_that.javaScriptMessage,_that.navigationDecision,_that.canGoBack,_that.canGoForward,_that.expandTitleBar,_that.showDebugToolbar,_that.historyUrls,_that.localStorageItems,_that.sessionStorageItems,_that.stateStatus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  TextEditingController urlEditorController,  WebViewController webViewController,  String? initialUrl,  String? title,  int? progress,  String? pageStarted,  String? pageFinished,  String? currentUrl,  String? errorMessage,  AppJavaScriptMessage? javaScriptMessage,  AppNavigationDecision? navigationDecision,  bool canGoBack,  bool canGoForward,  bool expandTitleBar,  bool showDebugToolbar,  List<String?> historyUrls,  Map<String?, dynamic> localStorageItems,  Map<String?, dynamic> sessionStorageItems,  StateStatus stateStatus)?  $default,) {final _that = this;
switch (_that) {
case _FeechWebViewState() when $default != null:
return $default(_that.id,_that.urlEditorController,_that.webViewController,_that.initialUrl,_that.title,_that.progress,_that.pageStarted,_that.pageFinished,_that.currentUrl,_that.errorMessage,_that.javaScriptMessage,_that.navigationDecision,_that.canGoBack,_that.canGoForward,_that.expandTitleBar,_that.showDebugToolbar,_that.historyUrls,_that.localStorageItems,_that.sessionStorageItems,_that.stateStatus);case _:
  return null;

}
}

}

/// @nodoc


class _FeechWebViewState implements FeechWebViewState {
  const _FeechWebViewState({required this.id, required this.urlEditorController, required this.webViewController, this.initialUrl, this.title, this.progress, this.pageStarted, this.pageFinished, this.currentUrl, this.errorMessage, this.javaScriptMessage, this.navigationDecision, this.canGoBack = false, this.canGoForward = false, this.expandTitleBar = false, this.showDebugToolbar = false, final  List<String?> historyUrls = const [], final  Map<String?, dynamic> localStorageItems = const {}, final  Map<String?, dynamic> sessionStorageItems = const {}, this.stateStatus = StateStatus.initial}): _historyUrls = historyUrls,_localStorageItems = localStorageItems,_sessionStorageItems = sessionStorageItems;
  

@override final  int? id;
@override final  TextEditingController urlEditorController;
@override final  WebViewController webViewController;
@override final  String? initialUrl;
@override final  String? title;
@override final  int? progress;
@override final  String? pageStarted;
@override final  String? pageFinished;
@override final  String? currentUrl;
@override final  String? errorMessage;
@override final  AppJavaScriptMessage? javaScriptMessage;
@override final  AppNavigationDecision? navigationDecision;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;
@override@JsonKey() final  bool expandTitleBar;
@override@JsonKey() final  bool showDebugToolbar;
 final  List<String?> _historyUrls;
@override@JsonKey() List<String?> get historyUrls {
  if (_historyUrls is EqualUnmodifiableListView) return _historyUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historyUrls);
}

 final  Map<String?, dynamic> _localStorageItems;
@override@JsonKey() Map<String?, dynamic> get localStorageItems {
  if (_localStorageItems is EqualUnmodifiableMapView) return _localStorageItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_localStorageItems);
}

 final  Map<String?, dynamic> _sessionStorageItems;
@override@JsonKey() Map<String?, dynamic> get sessionStorageItems {
  if (_sessionStorageItems is EqualUnmodifiableMapView) return _sessionStorageItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sessionStorageItems);
}

@override@JsonKey() final  StateStatus stateStatus;

/// Create a copy of FeechWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeechWebViewStateCopyWith<_FeechWebViewState> get copyWith => __$FeechWebViewStateCopyWithImpl<_FeechWebViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeechWebViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.urlEditorController, urlEditorController) || other.urlEditorController == urlEditorController)&&(identical(other.webViewController, webViewController) || other.webViewController == webViewController)&&(identical(other.initialUrl, initialUrl) || other.initialUrl == initialUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.pageStarted, pageStarted) || other.pageStarted == pageStarted)&&(identical(other.pageFinished, pageFinished) || other.pageFinished == pageFinished)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.javaScriptMessage, javaScriptMessage) || other.javaScriptMessage == javaScriptMessage)&&(identical(other.navigationDecision, navigationDecision) || other.navigationDecision == navigationDecision)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.expandTitleBar, expandTitleBar) || other.expandTitleBar == expandTitleBar)&&(identical(other.showDebugToolbar, showDebugToolbar) || other.showDebugToolbar == showDebugToolbar)&&const DeepCollectionEquality().equals(other._historyUrls, _historyUrls)&&const DeepCollectionEquality().equals(other._localStorageItems, _localStorageItems)&&const DeepCollectionEquality().equals(other._sessionStorageItems, _sessionStorageItems)&&(identical(other.stateStatus, stateStatus) || other.stateStatus == stateStatus));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,urlEditorController,webViewController,initialUrl,title,progress,pageStarted,pageFinished,currentUrl,errorMessage,javaScriptMessage,navigationDecision,canGoBack,canGoForward,expandTitleBar,showDebugToolbar,const DeepCollectionEquality().hash(_historyUrls),const DeepCollectionEquality().hash(_localStorageItems),const DeepCollectionEquality().hash(_sessionStorageItems),stateStatus]);

@override
String toString() {
  return 'FeechWebViewState(id: $id, urlEditorController: $urlEditorController, webViewController: $webViewController, initialUrl: $initialUrl, title: $title, progress: $progress, pageStarted: $pageStarted, pageFinished: $pageFinished, currentUrl: $currentUrl, errorMessage: $errorMessage, javaScriptMessage: $javaScriptMessage, navigationDecision: $navigationDecision, canGoBack: $canGoBack, canGoForward: $canGoForward, expandTitleBar: $expandTitleBar, showDebugToolbar: $showDebugToolbar, historyUrls: $historyUrls, localStorageItems: $localStorageItems, sessionStorageItems: $sessionStorageItems, stateStatus: $stateStatus)';
}


}

/// @nodoc
abstract mixin class _$FeechWebViewStateCopyWith<$Res> implements $FeechWebViewStateCopyWith<$Res> {
  factory _$FeechWebViewStateCopyWith(_FeechWebViewState value, $Res Function(_FeechWebViewState) _then) = __$FeechWebViewStateCopyWithImpl;
@override @useResult
$Res call({
 int? id, TextEditingController urlEditorController, WebViewController webViewController, String? initialUrl, String? title, int? progress, String? pageStarted, String? pageFinished, String? currentUrl, String? errorMessage, AppJavaScriptMessage? javaScriptMessage, AppNavigationDecision? navigationDecision, bool canGoBack, bool canGoForward, bool expandTitleBar, bool showDebugToolbar, List<String?> historyUrls, Map<String?, dynamic> localStorageItems, Map<String?, dynamic> sessionStorageItems, StateStatus stateStatus
});




}
/// @nodoc
class __$FeechWebViewStateCopyWithImpl<$Res>
    implements _$FeechWebViewStateCopyWith<$Res> {
  __$FeechWebViewStateCopyWithImpl(this._self, this._then);

  final _FeechWebViewState _self;
  final $Res Function(_FeechWebViewState) _then;

/// Create a copy of FeechWebViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? urlEditorController = null,Object? webViewController = null,Object? initialUrl = freezed,Object? title = freezed,Object? progress = freezed,Object? pageStarted = freezed,Object? pageFinished = freezed,Object? currentUrl = freezed,Object? errorMessage = freezed,Object? javaScriptMessage = freezed,Object? navigationDecision = freezed,Object? canGoBack = null,Object? canGoForward = null,Object? expandTitleBar = null,Object? showDebugToolbar = null,Object? historyUrls = null,Object? localStorageItems = null,Object? sessionStorageItems = null,Object? stateStatus = null,}) {
  return _then(_FeechWebViewState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,urlEditorController: null == urlEditorController ? _self.urlEditorController : urlEditorController // ignore: cast_nullable_to_non_nullable
as TextEditingController,webViewController: null == webViewController ? _self.webViewController : webViewController // ignore: cast_nullable_to_non_nullable
as WebViewController,initialUrl: freezed == initialUrl ? _self.initialUrl : initialUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int?,pageStarted: freezed == pageStarted ? _self.pageStarted : pageStarted // ignore: cast_nullable_to_non_nullable
as String?,pageFinished: freezed == pageFinished ? _self.pageFinished : pageFinished // ignore: cast_nullable_to_non_nullable
as String?,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,javaScriptMessage: freezed == javaScriptMessage ? _self.javaScriptMessage : javaScriptMessage // ignore: cast_nullable_to_non_nullable
as AppJavaScriptMessage?,navigationDecision: freezed == navigationDecision ? _self.navigationDecision : navigationDecision // ignore: cast_nullable_to_non_nullable
as AppNavigationDecision?,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,expandTitleBar: null == expandTitleBar ? _self.expandTitleBar : expandTitleBar // ignore: cast_nullable_to_non_nullable
as bool,showDebugToolbar: null == showDebugToolbar ? _self.showDebugToolbar : showDebugToolbar // ignore: cast_nullable_to_non_nullable
as bool,historyUrls: null == historyUrls ? _self._historyUrls : historyUrls // ignore: cast_nullable_to_non_nullable
as List<String?>,localStorageItems: null == localStorageItems ? _self._localStorageItems : localStorageItems // ignore: cast_nullable_to_non_nullable
as Map<String?, dynamic>,sessionStorageItems: null == sessionStorageItems ? _self._sessionStorageItems : sessionStorageItems // ignore: cast_nullable_to_non_nullable
as Map<String?, dynamic>,stateStatus: null == stateStatus ? _self.stateStatus : stateStatus // ignore: cast_nullable_to_non_nullable
as StateStatus,
  ));
}


}

// dart format on
