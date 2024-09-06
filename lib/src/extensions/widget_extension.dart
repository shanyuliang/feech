import 'dart:developer' as developer;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';

extension WidgetExtension on Widget {
  Stream<(int, ui.Image)> snapshotStream({
    BuildContext? context,
    double? pixelRatio,
    int timeoutInMilliseconds = 1000,
    bool debugLogDiagnostics = false,
  }) async* {
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
    final fallBackView = ui.PlatformDispatcher.instance.views.first;
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

    final startTime = DateTime.now();
    final timeoutTime =
        startTime.add(Duration(milliseconds: timeoutInMilliseconds));
    while (true) {
      final nowTime = DateTime.now();
      if (nowTime.isBefore(timeoutTime)) {
        if (isDirty) {
          isDirty = false;
          renderCount++;
          buildOwner.buildScope(rootElement);
          buildOwner.finalizeTree();
          pipelineOwner.flushLayout();
          pipelineOwner.flushCompositingBits();
          pipelineOwner.flushPaint();
          if (debugLogDiagnostics) {
            developer.log(
              "WidgetExtension snapshotStream render count $renderCount at ${nowTime.difference(startTime).inMilliseconds} milliseconds.",
              name: debugTag,
            );
          }
          yield (
            renderCount,
            await renderRepaintBoundary.toImage(pixelRatio: pixelRatio),
          );
        }
        await Future.delayed(frameDelay);
      } else {
        break;
      }
    }

    if (debugLogDiagnostics) {
      developer.log(
        "WidgetExtension snapshotStream returns because reached timeout $timeoutInMilliseconds milliseconds. Final render count is $renderCount.",
        name: debugTag,
      );
    }
  }

  Future<ui.Image?> getSnapshotImage({
    BuildContext? context,
    double? pixelRatio,
    int timeoutInMilliseconds = 1000,
    int targetRenderCount = 1,
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
    final fallBackView = ui.PlatformDispatcher.instance.views.first;
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
    final startTime = DateTime.now();
    final timeoutTime =
        startTime.add(Duration(milliseconds: timeoutInMilliseconds));
    while (renderCount < targetRenderCount) {
      final nowTime = DateTime.now();
      if (nowTime.isBefore(timeoutTime)) {
        if (isDirty) {
          isDirty = false;
          renderCount++;
          buildOwner.buildScope(rootElement);
          buildOwner.finalizeTree();
          pipelineOwner.flushLayout();
          pipelineOwner.flushCompositingBits();
          pipelineOwner.flushPaint();
          if (debugLogDiagnostics) {
            developer.log(
              "WidgetExtension getSnapshotImage render count $renderCount at ${nowTime.difference(startTime).inMilliseconds} milliseconds.",
              name: debugTag,
            );
          }
          image = await renderRepaintBoundary.toImage(pixelRatio: pixelRatio);
        }
        await Future.delayed(frameDelay);
      } else {
        break;
      }
    }

    if (debugLogDiagnostics) {
      if (renderCount < targetRenderCount) {
        developer.log(
          "WidgetExtension getSnapshotImage returns because reached timeout $timeoutInMilliseconds milliseconds. Final render count is $renderCount.",
          name: debugTag,
        );
      } else {
        final nowTime = DateTime.now();
        developer.log(
          "WidgetExtension getSnapshotImage returns because reached target render count $targetRenderCount. Final time usage is ${nowTime.difference(startTime).inMilliseconds} milliseconds.",
          name: debugTag,
        );
      }
    }

    return image;
  }
}
