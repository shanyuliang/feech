import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension WidgetExtension on Widget {
  Future<ui.Image?> getSnapshotImage({
    BuildContext? context,
    double? pixelRatio,
    Duration delay = const Duration(seconds: 1),
  }) async {
    Widget child = this;

    if (context != null) {
      child = InheritedTheme.captureAll(
        context,
        MediaQuery(
            data: MediaQuery.of(context),
            child: Material(
              color: Colors.transparent,
              child: child,
            )),
      );
    }

    final renderRepaintBoundary = RenderRepaintBoundary();
    final fallBackView = WidgetsBinding.instance.platformDispatcher.views.first;
    final view =
        context == null ? fallBackView : View.maybeOf(context) ?? fallBackView;
    pixelRatio ??= view.devicePixelRatio;

    final pipelineOwner = PipelineOwner();
    final renderView = RenderView(
      view: view,
      configuration: ViewConfiguration.fromView(view),
      child: RenderPositionedBox(
        alignment: Alignment.center,
        child: renderRepaintBoundary,
      ),
    );
    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final buildOwner = BuildOwner(focusManager: FocusManager());
    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: renderRepaintBoundary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    ).attachToRenderTree(buildOwner);
    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    await Future.delayed(delay);

    return renderRepaintBoundary.toImage(pixelRatio: pixelRatio);
  }
}
