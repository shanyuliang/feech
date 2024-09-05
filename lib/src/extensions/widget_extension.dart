import 'dart:ui' as ui;

import 'package:feech/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension WidgetExtension on Widget {
  Future<ui.Image?> getSnapshotImage({
    BuildContext? context,
    double? pixelRatio,
    Duration delay = const Duration(seconds: 1),
  }) async {
    int retryCounter = 3;
    bool isDirty = false;

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
    pixelRatio ??= context == null
        ? view.devicePixelRatio
        : MediaQuery.of(context).devicePixelRatio;

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

    final buildOwner = BuildOwner(
      focusManager: FocusManager(),
      onBuildScheduled: () {
        isDirty = true;
      },
    );
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

    ui.Image? image;

    do {
      isDirty = false;
      image = await renderRepaintBoundary.toImage(pixelRatio: pixelRatio);
      await Future.delayed(delay);
      debugPrint("$debugTag $isDirty");
      if (isDirty) {
        buildOwner.buildScope(
          rootElement,
        );
        buildOwner.finalizeTree();
        pipelineOwner.flushLayout();
        pipelineOwner.flushCompositingBits();
        pipelineOwner.flushPaint();
      }
      retryCounter--;
    } while (isDirty && retryCounter >= 0);
    try {
      buildOwner.finalizeTree();
    } catch (e) {
      debugPrint("$debugTag $e");
    }

    return image;
  }
}
