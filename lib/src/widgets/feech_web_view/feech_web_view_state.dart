import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../support/state_status.dart';

part 'feech_web_view_state.freezed.dart';

@Freezed()
abstract class FeechWebViewState with _$FeechWebViewState {
  const factory FeechWebViewState({
    required final int? id,
    required final TextEditingController urlEditorController,
    required final WebViewController webViewController,
    final String? initialUrl,
    final String? title,
    final int? progress,
    final String? pageStarted,
    final String? pageFinished,
    final String? currentUrl,
    final String? errorMessage,
    final FeechJavaScriptMessage? javaScriptMessage,
    final FeechNavigationDecision? navigationDecision,
    @Default(false) final bool canGoBack,
    @Default(false) final bool canGoForward,
    @Default(false) final bool expandTitleBar,
    @Default(false) final bool showDebugToolbar,
    @Default([]) final List<String?> historyUrls,
    @Default({}) final Map<String?, dynamic> localStorageItems,
    @Default({}) final Map<String?, dynamic> sessionStorageItems,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _FeechWebViewState;
}

typedef FeechJavaScriptMessage = ({String channel, String message});

typedef FeechNavigationDecision = ({String url, bool isMainFrame, bool allowed});
