import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../extensions/http_response_error_extension.dart';
import '../../extensions/web_resource_error_extension.dart';
import 'app_web_view_state.dart';

part 'app_web_view_state_provider.g.dart';

@Riverpod()
class AppWebViewStateProvider extends _$AppWebViewStateProvider {
  late final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onHttpAuthRequest: (HttpAuthRequest request) {
          debugPrint('Web View got http auth request: $request');
        },
        onHttpError: (HttpResponseError error) {
          debugPrint('Web View got http resource error: $error');
          _setErrorMessage(error.toReadableString());
        },
        onNavigationRequest: (NavigationRequest request) {
          debugPrint('Web View attend to load ${request.url}, isMainFrame: ${request.isMainFrame}');
          final allowNavigationResult = allowNavigation?.call(request.url, request.isMainFrame) ?? true;
          _setNavigationDecision(url: request.url, isMainFrame: request.isMainFrame, allowed: allowNavigationResult);
          debugPrint('Web View navigation ${allowNavigationResult ? "allowed" : "denied"}');
          return allowNavigationResult ? NavigationDecision.navigate : NavigationDecision.prevent;
        },
        onPageFinished: (String url) async {
          debugPrint('Web View page finished loading: $url');
          _setPageFinished(url);
        },
        onPageStarted: (String url) async {
          debugPrint('Web View page started loading: $url');
          _setPageStarted(url);
        },
        onProgress: (int progress) {
          debugPrint('Web View is loading (progress : $progress%)');
          _setProgress(progress);
        },
        onUrlChange: (UrlChange change) async {
          debugPrint('Web View url changes: ${change.url}');
          _setUrlChanged(change);
        },
        onWebResourceError: (WebResourceError error) {
          debugPrint('Web View got web resource error: $error');
          _setErrorMessage(error.toReadableString());
        },
      ),
    );

  @override
  AppWebViewState build({
    AppWebViewState? initialState,
    Set<String>? javaScriptChannelNames,
    bool Function(String url, bool isMainFrame)? allowNavigation,
  }) {
    javaScriptChannelNames?.forEach((element) {
      webViewController.addJavaScriptChannel(element, onMessageReceived: (JavaScriptMessage message) {
        debugPrint('Web View receive javaScript message "${message.message}" from channel $element');
        _setJavaScriptMessage(element, message.message);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text(message.message)),
        // );
      });
    });
    Future(() {
      loadUrl(state.initialUrl);
    });
    return initialState ?? AppWebViewState.nothing();
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

  void _setErrorMessage(String? errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
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
