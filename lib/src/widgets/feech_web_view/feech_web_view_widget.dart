import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'feech_web_view_app_bar.dart';
import 'feech_web_view_progress_bar.dart';
import 'feech_web_view_signal.dart';
import 'feech_web_view_title_bar.dart';

class FeechWebViewWidget extends StatelessWidget {
  final FeechWebViewSignal _signal;

  FeechWebViewWidget({super.key, int? id, String? initialUrl, String? title})
    : _signal = FeechWebViewSignal(id: id, initialUrl: initialUrl, title: title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeechWebViewAppBar(signal: _signal),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              FeechWebViewTitleBar(signal: _signal),
              FeechWebViewProgressBar(signal: _signal),
            ],
          ),
          Expanded(child: WebViewWidget(controller: _signal.peek().webViewController)),
        ],
      ),
    );
  }
}
