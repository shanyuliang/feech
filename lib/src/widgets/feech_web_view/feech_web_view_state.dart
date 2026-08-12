import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../support/state_status.dart';

part 'feech_web_view_state.freezed.dart';

@Freezed()
abstract class FeechWebViewState with _$FeechWebViewState {
  const factory FeechWebViewState({
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
    FeechJavaScriptMessage? javaScriptMessage,
    FeechNavigationDecision? navigationDecision,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
    @Default(false) bool expandTitleBar,
    @Default(false) bool showDebugToolbar,
    @Default([]) List<String?> historyUrls,
    @Default({}) Map<String?, dynamic> localStorageItems,
    @Default({}) Map<String?, dynamic> sessionStorageItems,
    @Default(StateStatus.initial) StateStatus stateStatus,
  }) = _FeechWebViewState;
}

typedef FeechJavaScriptMessage = ({String channel, String message});

typedef FeechNavigationDecision = ({String url, bool isMainFrame, bool allowed});
