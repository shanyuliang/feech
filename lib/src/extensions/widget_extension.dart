import 'dart:developer' as developer;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';

extension WidgetExtension on Widget {
  Future<ui.Image?> getSnapshotImage({
    BuildContext? context,
    double? pixelRatio,
    int timeoutInMilliSeconds = 1000,
    int minRenderCount = 1,
    bool debugLogDiagnostics = false,
  }) async {
    int renderCount = 0;
    bool isDirty = true;

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

    ui.Image? image;
    final timeoutTime =
        DateTime.now().add(Duration(milliseconds: timeoutInMilliSeconds));
    while (
        renderCount < minRenderCount && DateTime.now().isBefore(timeoutTime)) {
      if (isDirty) {
        isDirty = false;
        renderCount++;
        if (debugLogDiagnostics) {
          developer.log(
            "WidgetExtension getSnapshotImage render count $renderCount",
            name: debugTag,
          );
        }
        buildOwner.buildScope(rootElement);
        buildOwner.finalizeTree();
        pipelineOwner.flushLayout();
        pipelineOwner.flushCompositingBits();
        pipelineOwner.flushPaint();
        image = await renderRepaintBoundary.toImage(pixelRatio: pixelRatio);
      } else {
        await Future.delayed(frameDelay);
      }
    }

    if (debugLogDiagnostics) {
      if (renderCount < minRenderCount) {
        developer.log(
          "WidgetExtension getSnapshotImage returns because timeout",
          name: debugTag,
        );
      } else {
        developer.log(
          "WidgetExtension getSnapshotImage returns because reached minRenderCount",
          name: debugTag,
        );
      }
    }

    return image;
  }
}
