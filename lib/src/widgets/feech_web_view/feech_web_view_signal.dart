import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../extensions/http_response_error_extension.dart';
import '../../extensions/web_resource_error_extension.dart';
import '../../extensions/web_view_controller_extension.dart';
import '../../models/web_storage_type.dart';
import 'feech_web_view_state.dart';

class FeechWebViewSignal extends Signal<FeechWebViewState> {
  late final WebViewController _webViewController;

  FeechWebViewSignal({
    int? id,
    String? initialUrl,
    String? title,
    Set<String>? javaScriptChannelNames,
    bool Function(String url, bool isMainFrame)? allowNavigation,
    bool debugLogDiagnostics = false,
  }) : super(
         FeechWebViewState(
           id: id ?? DateTime.now().microsecondsSinceEpoch,
           initialUrl: initialUrl,
           title: title,
           urlEditorController: TextEditingController(text: initialUrl),
           webViewController: WebViewController(),
         ),
         debugLabel: "SvgStringSignal",
       ) {
    _webViewController = value.webViewController
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
    javaScriptChannelNames?.forEach((element) {
      _webViewController.addJavaScriptChannel(
        element,
        onMessageReceived: (JavaScriptMessage message) {
          debugPrint('Web View receive javaScript message "${message.message}" from channel $element');
          _setJavaScriptMessage(element, message.message);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(message.message)),
          // );
        },
      );
    });
    Future(() {
      loadUrl(value.initialUrl);
    });
  }

  Future<void> loadUrl(String? url) async {
    if (url != null) {
      final uri = Uri.tryParse(url);
      if (uri != null) {
        _webViewController.loadRequest(uri);
      }
    }
  }

  Future<void> goBack() async {
    _webViewController.goBack();
  }

  Future<void> goForward() async {
    _webViewController.goForward();
  }

  Future<void> reload() async {
    _webViewController.reload();
  }

  Future<void> toggleTitleBarExpansion() async {
    final currentValue = peek();
    value = currentValue.copyWith(expandTitleBar: !currentValue.expandTitleBar);
  }

  void _setProgress(int progress) {
    final currentValue = peek();
    value = currentValue.copyWith(progress: progress);
    if (progress == 100) {
      _refresh();
    }
  }

  void _setPageStarted(String url) {
    final currentValue = peek();
    value = currentValue.copyWith(pageStarted: url);
    _refresh();
  }

  void _setPageFinished(String url) {
    final currentValue = peek();
    value = currentValue.copyWith(pageFinished: url);
    _refresh();
  }

  void _setUrlChanged(UrlChange change) {
    final currentValue = peek();
    currentValue.urlEditorController.text = change.url ?? '';
    value = currentValue.copyWith(currentUrl: change.url);
    _refresh();
  }

  void _setErrorMessage(String? errorMessage) {
    final currentValue = peek();
    value = currentValue.copyWith(errorMessage: errorMessage);
  }

  void _setJavaScriptMessage(String channelName, String message) {
    final currentValue = peek();
    value = currentValue.copyWith(javaScriptMessage: (channel: channelName, message: message));
  }

  void _setNavigationDecision({required String url, required bool isMainFrame, required bool allowed}) {
    final currentValue = peek();
    value = currentValue.copyWith(navigationDecision: (url: url, isMainFrame: isMainFrame, allowed: allowed));
  }

  Future<void> _refresh() async {
    final currentValue = peek();
    final title = await _webViewController.getTitle();
    final canGoBack = await _webViewController.canGoBack();
    final canGoForward = await _webViewController.canGoForward();
    // final historyUrls =
    //     state.showDebugToolbar ? ((await _webViewController.getCopyBackForwardList())?.list ?? []).map((item) => item.url).toList() : <Uri?>[];
    final localStorageItems = currentValue.showDebugToolbar
        ? {for (final item in (await _webViewController.getAllWebStorageItems(webStorageType: WebStorageType.localStorage))) item.key: item.value}
        : <String?, dynamic>{};
    final sessionStorageItems = currentValue.showDebugToolbar
        ? {for (final item in (await _webViewController.getAllWebStorageItems(webStorageType: WebStorageType.sessionStorage))) item.key: item.value}
        : <String?, dynamic>{};
    value = currentValue.copyWith(
      title: title,
      canGoBack: canGoBack,
      canGoForward: canGoForward,
      localStorageItems: localStorageItems,
      sessionStorageItems: sessionStorageItems,
    );
  }
}
