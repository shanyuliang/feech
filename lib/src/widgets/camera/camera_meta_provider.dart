import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support/state_status.dart';
import 'camera_meta.dart';

part 'camera_meta_provider.g.dart';

@Riverpod()
class CameraMetaProvider extends _$CameraMetaProvider {
  @override
  CameraMeta build() {
    Future(() {
      _initCamera();
    });
    ref.onDispose(() {
      state.selectedCameraController?.dispose();
    });
    return const CameraMeta();
  }

  Future<void> _initCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    state = state.copyWith(stateStatus: StateStatus.updating);
    final cameraDescriptions = await availableCameras();
    final selectedCameraDescription = cameraDescriptions.first;
    final selectedCameraController = CameraController(selectedCameraDescription, ResolutionPreset.high);
    await selectedCameraController.initialize();
    state = state.copyWith(
      cameraDescriptions: cameraDescriptions,
      selectedCameraDescription: selectedCameraDescription,
      selectedCameraController: selectedCameraController,
      imagePath: null,
      stateStatus: StateStatus.updated,
    );
  }

  void setImagePath(String imagePath) {
    state = state.copyWith(imagePath: imagePath);
  }

  void clearImagePath() {
    state = state.copyWith(imagePath: null);
  }
}
