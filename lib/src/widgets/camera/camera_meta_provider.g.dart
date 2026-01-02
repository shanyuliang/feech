// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_meta_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CameraMetaProvider)
final cameraMetaProvider = CameraMetaProviderProvider._();

final class CameraMetaProviderProvider
    extends $NotifierProvider<CameraMetaProvider, CameraMeta> {
  CameraMetaProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraMetaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraMetaProviderHash();

  @$internal
  @override
  CameraMetaProvider create() => CameraMetaProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CameraMeta value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CameraMeta>(value),
    );
  }
}

String _$cameraMetaProviderHash() =>
    r'a9fa200b985aeebb6bb9162c8a7ccff856545fef';

abstract class _$CameraMetaProvider extends $Notifier<CameraMeta> {
  CameraMeta build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CameraMeta, CameraMeta>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CameraMeta, CameraMeta>,
              CameraMeta,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
