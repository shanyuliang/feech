import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../support/state_status.dart';

part 'camera_meta.freezed.dart';

@Freezed()
class CameraMeta with _$CameraMeta {
  const factory CameraMeta({
    final List<CameraDescription>? cameraDescriptions,
    final CameraDescription? selectedCameraDescription,
    final CameraController? selectedCameraController,
    final String? imagePath,
    @Default(StateStatus.initial) final StateStatus stateStatus,
  }) = _CameraMeta;
}
