import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension WidgetExtension on Widget {
  /// If you are building a desktop/web application that supports multiple view. Consider passing the [context] so that flutter know which view to capture.
  Future<ui.Image?> getSnapshotImage({
    BuildContext? context,
    double pixelRatio = 1.0,
    Size? targetSize,
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
    final platformDispatcher = WidgetsBinding.instance.platformDispatcher;
    final fallBackView = platformDispatcher.views.first;
    final view =
        context == null ? fallBackView : View.maybeOf(context) ?? fallBackView;
    final logicalSize =
        targetSize ?? view.physicalSize / view.devicePixelRatio; // Adapted
    final imageSize = targetSize ?? view.physicalSize; // Adapted

    assert(logicalSize.aspectRatio.toStringAsPrecision(5) ==
        imageSize.aspectRatio
            .toStringAsPrecision(5)); // Adapted (toPrecision was not available)

    final pipelineOwner = PipelineOwner();
    final renderView = RenderView(
      view: view,
      configuration: ViewConfiguration(
        logicalConstraints: BoxConstraints(
          maxWidth: logicalSize.width,
          maxHeight: logicalSize.height,
        ),
        devicePixelRatio: pixelRatio,
      ),
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

    await Future.delayed(delay);

    ui.Image? image;
    do {
      isDirty = false;
      image = await renderRepaintBoundary.toImage(pixelRatio: pixelRatio);
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
      debugPrint(e.toString());
    }

    return image;
  }
}
