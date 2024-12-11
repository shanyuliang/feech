import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../support/state_status.dart';

part 'app_web_view_state.freezed.dart';

@Freezed()
class AppWebViewState with _$AppWebViewState {
  const factory AppWebViewState({
    required final int? id,
    required final TextEditingController urlEditorController,
    final String? initialUrl,
    final String? title,
    final int? progress,
    final String? pageStarted,
    final String? pageFinished,
    final String? currentUrl,
    final String? errorMessage,
    final AppJavaScriptMessage? javaScriptMessage,
    final AppNavigationDecision? navigationDecision,
    @Default(false) final bool canGoBack,
    @Default(false) final bool canGoForward,
    @Default(false) final bool expandTitleBar,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _AppWebViewState;

  static AppWebViewState nothing() => AppWebViewState(
        id: DateTime.now().microsecondsSinceEpoch,
        urlEditorController: TextEditingController(),
      );

  static AppWebViewState fromData({int? id, String? initialUrl, String? title}) => AppWebViewState(
        id: id ?? DateTime.now().microsecondsSinceEpoch,
        initialUrl: initialUrl,
        title: title,
        urlEditorController: TextEditingController(text: initialUrl),
      );
}

typedef AppJavaScriptMessage = ({
  String channel,
  String message,
});

typedef AppNavigationDecision = ({
  String url,
  bool isMainFrame,
  bool allowed,
});
