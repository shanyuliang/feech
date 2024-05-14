import 'dart:developer' as developer;
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../support/state_status.dart';
import 'camera_meta_provider.dart';

class TakePictureScreen extends ConsumerStatefulWidget {
  static const iconButtonSize = 48.0;
  final String? title;
  final bool? confirm;
  final bool debugLogDiagnostics;

  const TakePictureScreen({super.key, this.title, this.confirm, this.debugLogDiagnostics = false});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends ConsumerState<TakePictureScreen> {
  @override
  Widget build(BuildContext context) {
    final cameraMeta = ref.watch(cameraMetaProvider);
    if (cameraMeta.stateStatus == StateStatus.updated) {
      if (cameraMeta.imagePath != null) {
        if (widget.confirm ?? false) {
          return _ConfirmPictureWidget(title: widget.title, debugLogDiagnostics: widget.debugLogDiagnostics);
        } else {
          Future(() {
            Navigator.pop(context, cameraMeta.imagePath);
          });
          return _CameraLoadingWidget(title: widget.title);
        }
      } else {
        return _CameraPreviewWidget(
          title: widget.title,
          confirm: widget.confirm,
          debugLogDiagnostics: widget.debugLogDiagnostics,
        );
      }
    } else {
      return _CameraLoadingWidget(title: widget.title);
    }
  }
}

class _CameraLoadingWidget extends ConsumerWidget {
  final String? title;

  const _CameraLoadingWidget({this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _CameraPreviewWidget extends ConsumerStatefulWidget {
  final String? title;
  final bool? confirm;
  final bool debugLogDiagnostics;

  const _CameraPreviewWidget({this.title, this.confirm, this.debugLogDiagnostics = false});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends ConsumerState<_CameraPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    final cameraMeta = ref.watch(cameraMetaProvider);
    final cameraController = cameraMeta.selectedCameraController;
    return Scaffold(
      appBar: widget.title != null ? AppBar(title: Text(widget.title!)) : null,
      body: cameraController != null
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1 / cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera),
                  iconSize: TakePictureScreen.iconButtonSize,
                  tooltip: 'take picture',
                  onPressed: _onShutterButtonClicked,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Future<void> _onShutterButtonClicked() async {
    try {
      final cameraMeta = ref.read(cameraMetaProvider);
      final cameraController = cameraMeta.selectedCameraController;
      if (cameraController != null) {
        final photoFile = await cameraController.takePicture();
        if (widget.debugLogDiagnostics) {
          developer.log("TakePictureScreen path ${photoFile.path}", name: debugTag);
        }
        ref.read(cameraMetaProvider.notifier).setImagePath(photoFile.path);
      }
    } catch (e) {
      if (widget.debugLogDiagnostics) {
        developer.log("TakePictureScreen $e", name: debugTag);
      }
    }
  }
}

class _ConfirmPictureWidget extends ConsumerStatefulWidget {
  final String? title;
  final bool debugLogDiagnostics;

  const _ConfirmPictureWidget({this.title, this.debugLogDiagnostics = false});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmPictureWidgetState();
}

class _ConfirmPictureWidgetState extends ConsumerState<_ConfirmPictureWidget> {
  @override
  Widget build(BuildContext context) {
    final cameraMeta = ref.watch(cameraMetaProvider);
    final cameraController = cameraMeta.selectedCameraController;
    return Scaffold(
      appBar: widget.title != null ? AppBar(title: Text(widget.title!)) : null,
      body: cameraController != null
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: Image.file(File(cameraMeta.imagePath!)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: TakePictureScreen.iconButtonSize,
                      tooltip: 'don\'t use this picture',
                      onPressed: _onCancelButtonClicked,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.check),
                      iconSize: TakePictureScreen.iconButtonSize,
                      tooltip: 'use this picture',
                      onPressed: _onConfirmButtonClicked,
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  void _onConfirmButtonClicked() async {
    try {
      final cameraMeta = ref.read(cameraMetaProvider);
      Navigator.pop(context, cameraMeta.imagePath);
    } catch (e) {
      if (widget.debugLogDiagnostics) {
        developer.log("TakePictureScreen $e", name: debugTag);
      }
    }
  }

  void _onCancelButtonClicked() async {
    try {
      ref.read(cameraMetaProvider.notifier).clearImagePath();
    } catch (e) {
      if (widget.debugLogDiagnostics) {
        developer.log("TakePictureScreen $e", name: debugTag);
      }
    }
  }
}
