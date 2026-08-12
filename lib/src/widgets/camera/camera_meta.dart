import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../support/state_status.dart';

part 'camera_meta.freezed.dart';

@Freezed()
abstract class CameraMeta with _$CameraMeta {
  const factory CameraMeta({
    List<CameraDescription>? cameraDescriptions,
    CameraDescription? selectedCameraDescription,
    CameraController? selectedCameraController,
    String? imagePath,
    @Default(StateStatus.initial) StateStatus stateStatus,
  }) = _CameraMeta;
}
