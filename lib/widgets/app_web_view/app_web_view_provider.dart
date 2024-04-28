import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_web_view_state.dart';

part 'app_web_view_provider.g.dart';

@Riverpod()
class AppWebView extends _$AppWebView {
  late final WebViewController webViewController;

  @override
  AppWebViewState build({
    AppWebViewState? initialState,
    Set<String>? javaScriptChannelNames,
    bool Function(String url, bool isMainFrame)? allowNavigation,
  }) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('Web View is loading (progress : $progress%)');
            _setProgress(progress);
          },
          onPageStarted: (String url) async {
            debugPrint('Web View page started loading: $url');
            _setPageStarted(url);
          },
          onPageFinished: (String url) async {
            debugPrint('Web View page finished loading: $url');
            _setPageFinished(url);
          },
          onUrlChange: (UrlChange change) async {
            debugPrint('Web View page url changes: ${change.url}');
            _setUrlChanged(change);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            debugPrint('Web View attend to load ${request.url}, isMainFrame: ${request.isMainFrame}');
            final allowNavigationResult = allowNavigation?.call(request.url, request.isMainFrame) ?? true;
            _setNavigationDecision(url: request.url, isMainFrame: request.isMainFrame, allowed: allowNavigationResult);
            debugPrint('Web View navigation ${allowNavigationResult ? "allowed" : "denied"}');
            return allowNavigationResult ? NavigationDecision.navigate : NavigationDecision.prevent;
          },
        ),
      );
    javaScriptChannelNames?.forEach((element) {
      webViewController.addJavaScriptChannel(element, onMessageReceived: (JavaScriptMessage message) {
        debugPrint('Web View receive javaScript message "${message.message}" from channel $element');
        _setJavaScriptMessage(element, message.message);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text(message.message)),
        // );
      });
    });
    loadUrl(state.initialUrl);
    return AppWebViewState.nothing();
  }

  Future<void> loadUrl(String? url) async {
    if (url != null) {
      final uri = Uri.tryParse(url);
      if (uri != null) {
        webViewController.loadRequest(uri);
      }
    }
  }

  Future<void> goBack() async {
    webViewController.goBack();
  }

  Future<void> goForward() async {
    webViewController.goForward();
  }

  Future<void> reload() async {
    webViewController.reload();
  }

  Future<void> toggleTitleBarExpansion() async {
    state = state.copyWith(expandTitleBar: !state.expandTitleBar);
  }

  void _setProgress(int progress) {
    state = state.copyWith(progress: progress);
    if (progress == 100) {
      _refresh();
    }
  }

  void _setPageStarted(String url) {
    state = state.copyWith(pageStarted: url);
    _refresh();
  }

  void _setPageFinished(String url) {
    state = state.copyWith(pageFinished: url);
    _refresh();
  }

  void _setUrlChanged(UrlChange change) {
    state.urlEditorController.text = change.url ?? '';
    state = state.copyWith(currentUrl: change.url);
  }

  void _setJavaScriptMessage(String channelName, String message) {
    state = state.copyWith(javaScriptMessage: (channel: channelName, message: message));
  }

  void _setNavigationDecision({required String url, required bool isMainFrame, required bool allowed}) {
    state = state.copyWith(navigationDecision: (url: url, isMainFrame: isMainFrame, allowed: allowed));
  }

  Future<void> _refresh() async {
    final title = await webViewController.getTitle();
    final canGoBack = await webViewController.canGoBack();
    final canGoForward = await webViewController.canGoForward();
    state = state.copyWith(title: title, canGoBack: canGoBack, canGoForward: canGoForward);
  }
}

// final appWebViewProvider =
//     StateNotifierProvider.autoDispose.family<AppWebViewNotifier, AppWebViewState, AppWebViewState?>((ref, initialState) {
//   return AppWebViewNotifier(initialState: initialState);
// });
