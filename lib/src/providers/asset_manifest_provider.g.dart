// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_manifest_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AssetManifestProvider)
final assetManifestProvider = AssetManifestProviderFamily._();

final class AssetManifestProviderProvider
    extends $AsyncNotifierProvider<AssetManifestProvider, AssetManifest> {
  AssetManifestProviderProvider._({
    required AssetManifestProviderFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'assetManifestProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$assetManifestProviderHash();

  @override
  String toString() {
    return r'assetManifestProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AssetManifestProvider create() => AssetManifestProvider();

  @override
  bool operator ==(Object other) {
    return other is AssetManifestProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$assetManifestProviderHash() =>
    r'7694b89852c875d682feb821415158eae603f893';

final class AssetManifestProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          AssetManifestProvider,
          AsyncValue<AssetManifest>,
          AssetManifest,
          FutureOr<AssetManifest>,
          bool
        > {
  AssetManifestProviderFamily._()
    : super(
        retry: null,
        name: r'assetManifestProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AssetManifestProviderProvider call({bool debugLogDiagnostics = false}) =>
      AssetManifestProviderProvider._(
        argument: debugLogDiagnostics,
        from: this,
      );

  @override
  String toString() => r'assetManifestProvider';
}

abstract class _$AssetManifestProvider extends $AsyncNotifier<AssetManifest> {
  late final _$args = ref.$arg as bool;
  bool get debugLogDiagnostics => _$args;

  FutureOr<AssetManifest> build({bool debugLogDiagnostics = false});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AssetManifest>, AssetManifest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AssetManifest>, AssetManifest>,
              AsyncValue<AssetManifest>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(debugLogDiagnostics: _$args));
  }
}
