import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_web_view_app_bar.dart';
import 'app_web_view_progress_bar.dart';
import 'app_web_view_state_provider.dart';
import 'app_web_view_state.dart';
import 'app_web_view_title_bar.dart';

class AppWebViewWidget extends ConsumerWidget {
  final AppWebViewStateProviderProvider _appWebViewProvider;

  AppWebViewWidget({super.key, int? id, String? initialUrl, String? title})
      : _appWebViewProvider =
            appWebViewStateProvider(initialState: AppWebViewState.fromData(id: id, initialUrl: initialUrl, title: title));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppWebViewAppBar(provider: _appWebViewProvider),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              AppWebViewTitleBar(provider: _appWebViewProvider),
              AppWebViewProgressBar(provider: _appWebViewProvider),
            ],
          ),
          Expanded(
            child: WebViewWidget(controller: ref.read(_appWebViewProvider.notifier).webViewController),
          ),
        ],
      ),
    );
  }
}
