// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_web_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppWebViewState {
  int? get id => throw _privateConstructorUsedError;
  TextEditingController get urlEditorController =>
      throw _privateConstructorUsedError;
  String? get initialUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  String? get pageStarted => throw _privateConstructorUsedError;
  String? get pageFinished => throw _privateConstructorUsedError;
  String? get currentUrl => throw _privateConstructorUsedError;
  ({String channel, String message})? get javaScriptMessage =>
      throw _privateConstructorUsedError;
  ({bool allowed, bool isMainFrame, String url})? get navigationDecision =>
      throw _privateConstructorUsedError;
  bool get canGoBack => throw _privateConstructorUsedError;
  bool get canGoForward => throw _privateConstructorUsedError;
  bool get expandTitleBar => throw _privateConstructorUsedError;
  StateStatus get stateStatus => throw _privateConstructorUsedError;

  /// Create a copy of AppWebViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppWebViewStateCopyWith<AppWebViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppWebViewStateCopyWith<$Res> {
  factory $AppWebViewStateCopyWith(
          AppWebViewState value, $Res Function(AppWebViewState) then) =
      _$AppWebViewStateCopyWithImpl<$Res, AppWebViewState>;
  @useResult
  $Res call(
      {int? id,
      TextEditingController urlEditorController,
      String? initialUrl,
      String? title,
      int? progress,
      String? pageStarted,
      String? pageFinished,
      String? currentUrl,
      ({String channel, String message})? javaScriptMessage,
      ({bool allowed, bool isMainFrame, String url})? navigationDecision,
      bool canGoBack,
      bool canGoForward,
      bool expandTitleBar,
      StateStatus stateStatus});
}

/// @nodoc
class _$AppWebViewStateCopyWithImpl<$Res, $Val extends AppWebViewState>
    implements $AppWebViewStateCopyWith<$Res> {
  _$AppWebViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppWebViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? urlEditorController = null,
    Object? initialUrl = freezed,
    Object? title = freezed,
    Object? progress = freezed,
    Object? pageStarted = freezed,
    Object? pageFinished = freezed,
    Object? currentUrl = freezed,
    Object? javaScriptMessage = freezed,
    Object? navigationDecision = freezed,
    Object? canGoBack = null,
    Object? canGoForward = null,
    Object? expandTitleBar = null,
    Object? stateStatus = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      urlEditorController: null == urlEditorController
          ? _value.urlEditorController
          : urlEditorController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      initialUrl: freezed == initialUrl
          ? _value.initialUrl
          : initialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      pageStarted: freezed == pageStarted
          ? _value.pageStarted
          : pageStarted // ignore: cast_nullable_to_non_nullable
              as String?,
      pageFinished: freezed == pageFinished
          ? _value.pageFinished
          : pageFinished // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUrl: freezed == currentUrl
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      javaScriptMessage: freezed == javaScriptMessage
          ? _value.javaScriptMessage
          : javaScriptMessage // ignore: cast_nullable_to_non_nullable
              as ({String channel, String message})?,
      navigationDecision: freezed == navigationDecision
          ? _value.navigationDecision
          : navigationDecision // ignore: cast_nullable_to_non_nullable
              as ({bool allowed, bool isMainFrame, String url})?,
      canGoBack: null == canGoBack
          ? _value.canGoBack
          : canGoBack // ignore: cast_nullable_to_non_nullable
              as bool,
      canGoForward: null == canGoForward
          ? _value.canGoForward
          : canGoForward // ignore: cast_nullable_to_non_nullable
              as bool,
      expandTitleBar: null == expandTitleBar
          ? _value.expandTitleBar
          : expandTitleBar // ignore: cast_nullable_to_non_nullable
              as bool,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppWebViewStateImplCopyWith<$Res>
    implements $AppWebViewStateCopyWith<$Res> {
  factory _$$AppWebViewStateImplCopyWith(_$AppWebViewStateImpl value,
          $Res Function(_$AppWebViewStateImpl) then) =
      __$$AppWebViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      TextEditingController urlEditorController,
      String? initialUrl,
      String? title,
      int? progress,
      String? pageStarted,
      String? pageFinished,
      String? currentUrl,
      ({String channel, String message})? javaScriptMessage,
      ({bool allowed, bool isMainFrame, String url})? navigationDecision,
      bool canGoBack,
      bool canGoForward,
      bool expandTitleBar,
      StateStatus stateStatus});
}

/// @nodoc
class __$$AppWebViewStateImplCopyWithImpl<$Res>
    extends _$AppWebViewStateCopyWithImpl<$Res, _$AppWebViewStateImpl>
    implements _$$AppWebViewStateImplCopyWith<$Res> {
  __$$AppWebViewStateImplCopyWithImpl(
      _$AppWebViewStateImpl _value, $Res Function(_$AppWebViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppWebViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? urlEditorController = null,
    Object? initialUrl = freezed,
    Object? title = freezed,
    Object? progress = freezed,
    Object? pageStarted = freezed,
    Object? pageFinished = freezed,
    Object? currentUrl = freezed,
    Object? javaScriptMessage = freezed,
    Object? navigationDecision = freezed,
    Object? canGoBack = null,
    Object? canGoForward = null,
    Object? expandTitleBar = null,
    Object? stateStatus = null,
  }) {
    return _then(_$AppWebViewStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      urlEditorController: null == urlEditorController
          ? _value.urlEditorController
          : urlEditorController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      initialUrl: freezed == initialUrl
          ? _value.initialUrl
          : initialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      pageStarted: freezed == pageStarted
          ? _value.pageStarted
          : pageStarted // ignore: cast_nullable_to_non_nullable
              as String?,
      pageFinished: freezed == pageFinished
          ? _value.pageFinished
          : pageFinished // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUrl: freezed == currentUrl
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      javaScriptMessage: freezed == javaScriptMessage
          ? _value.javaScriptMessage
          : javaScriptMessage // ignore: cast_nullable_to_non_nullable
              as ({String channel, String message})?,
      navigationDecision: freezed == navigationDecision
          ? _value.navigationDecision
          : navigationDecision // ignore: cast_nullable_to_non_nullable
              as ({bool allowed, bool isMainFrame, String url})?,
      canGoBack: null == canGoBack
          ? _value.canGoBack
          : canGoBack // ignore: cast_nullable_to_non_nullable
              as bool,
      canGoForward: null == canGoForward
          ? _value.canGoForward
          : canGoForward // ignore: cast_nullable_to_non_nullable
              as bool,
      expandTitleBar: null == expandTitleBar
          ? _value.expandTitleBar
          : expandTitleBar // ignore: cast_nullable_to_non_nullable
              as bool,
      stateStatus: null == stateStatus
          ? _value.stateStatus
          : stateStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
    ));
  }
}

/// @nodoc

class _$AppWebViewStateImpl implements _AppWebViewState {
  const _$AppWebViewStateImpl(
      {required this.id,
      required this.urlEditorController,
      this.initialUrl,
      this.title,
      this.progress,
      this.pageStarted,
      this.pageFinished,
      this.currentUrl,
      this.javaScriptMessage,
      this.navigationDecision,
      this.canGoBack = false,
      this.canGoForward = false,
      this.expandTitleBar = false,
      this.stateStatus = StateStatus.initial});

  @override
  final int? id;
  @override
  final TextEditingController urlEditorController;
  @override
  final String? initialUrl;
  @override
  final String? title;
  @override
  final int? progress;
  @override
  final String? pageStarted;
  @override
  final String? pageFinished;
  @override
  final String? currentUrl;
  @override
  final ({String channel, String message})? javaScriptMessage;
  @override
  final ({bool allowed, bool isMainFrame, String url})? navigationDecision;
  @override
  @JsonKey()
  final bool canGoBack;
  @override
  @JsonKey()
  final bool canGoForward;
  @override
  @JsonKey()
  final bool expandTitleBar;
  @override
  @JsonKey()
  final StateStatus stateStatus;

  @override
  String toString() {
    return 'AppWebViewState(id: $id, urlEditorController: $urlEditorController, initialUrl: $initialUrl, title: $title, progress: $progress, pageStarted: $pageStarted, pageFinished: $pageFinished, currentUrl: $currentUrl, javaScriptMessage: $javaScriptMessage, navigationDecision: $navigationDecision, canGoBack: $canGoBack, canGoForward: $canGoForward, expandTitleBar: $expandTitleBar, stateStatus: $stateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppWebViewStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.urlEditorController, urlEditorController) ||
                other.urlEditorController == urlEditorController) &&
            (identical(other.initialUrl, initialUrl) ||
                other.initialUrl == initialUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.pageStarted, pageStarted) ||
                other.pageStarted == pageStarted) &&
            (identical(other.pageFinished, pageFinished) ||
                other.pageFinished == pageFinished) &&
            (identical(other.currentUrl, currentUrl) ||
                other.currentUrl == currentUrl) &&
            (identical(other.javaScriptMessage, javaScriptMessage) ||
                other.javaScriptMessage == javaScriptMessage) &&
            (identical(other.navigationDecision, navigationDecision) ||
                other.navigationDecision == navigationDecision) &&
            (identical(other.canGoBack, canGoBack) ||
                other.canGoBack == canGoBack) &&
            (identical(other.canGoForward, canGoForward) ||
                other.canGoForward == canGoForward) &&
            (identical(other.expandTitleBar, expandTitleBar) ||
                other.expandTitleBar == expandTitleBar) &&
            (identical(other.stateStatus, stateStatus) ||
                other.stateStatus == stateStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      urlEditorController,
      initialUrl,
      title,
      progress,
      pageStarted,
      pageFinished,
      currentUrl,
      javaScriptMessage,
      navigationDecision,
      canGoBack,
      canGoForward,
      expandTitleBar,
      stateStatus);

  /// Create a copy of AppWebViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppWebViewStateImplCopyWith<_$AppWebViewStateImpl> get copyWith =>
      __$$AppWebViewStateImplCopyWithImpl<_$AppWebViewStateImpl>(
          this, _$identity);
}

abstract class _AppWebViewState implements AppWebViewState {
  const factory _AppWebViewState(
      {required final int? id,
      required final TextEditingController urlEditorController,
      final String? initialUrl,
      final String? title,
      final int? progress,
      final String? pageStarted,
      final String? pageFinished,
      final String? currentUrl,
      final ({String channel, String message})? javaScriptMessage,
      final ({bool allowed, bool isMainFrame, String url})? navigationDecision,
      final bool canGoBack,
      final bool canGoForward,
      final bool expandTitleBar,
      final StateStatus stateStatus}) = _$AppWebViewStateImpl;

  @override
  int? get id;
  @override
  TextEditingController get urlEditorController;
  @override
  String? get initialUrl;
  @override
  String? get title;
  @override
  int? get progress;
  @override
  String? get pageStarted;
  @override
  String? get pageFinished;
  @override
  String? get currentUrl;
  @override
  ({String channel, String message})? get javaScriptMessage;
  @override
  ({bool allowed, bool isMainFrame, String url})? get navigationDecision;
  @override
  bool get canGoBack;
  @override
  bool get canGoForward;
  @override
  bool get expandTitleBar;
  @override
  StateStatus get stateStatus;

  /// Create a copy of AppWebViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppWebViewStateImplCopyWith<_$AppWebViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
