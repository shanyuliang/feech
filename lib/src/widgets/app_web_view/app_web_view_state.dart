import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../support/state_status.dart';

part 'app_web_view_state.freezed.dart';

@Freezed()
abstract class AppWebViewState with _$AppWebViewState {
  const factory AppWebViewState({
    required int? id,
    required TextEditingController urlEditorController,
    required WebViewController webViewController,
    String? initialUrl,
    String? title,
    int? progress,
    String? pageStarted,
    String? pageFinished,
    String? currentUrl,
    String? errorMessage,
    AppJavaScriptMessage? javaScriptMessage,
    AppNavigationDecision? navigationDecision,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
    @Default(false) bool expandTitleBar,
    @Default(false) bool showDebugToolbar,
    @Default([]) List<String?> historyUrls,
    @Default({}) Map<String?, dynamic> localStorageItems,
    @Default({}) Map<String?, dynamic> sessionStorageItems,
    @Default(StateStatus.initial) StateStatus stateStatus,
  }) = _AppWebViewState;
}

typedef AppJavaScriptMessage = ({String channel, String message});

typedef AppNavigationDecision = ({String url, bool isMainFrame, bool allowed});
