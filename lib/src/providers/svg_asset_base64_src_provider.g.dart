// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_asset_base64_src_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SvgAssetBase64SrcProvider)
const svgAssetBase64SrcProvider = SvgAssetBase64SrcProviderFamily._();

final class SvgAssetBase64SrcProviderProvider
    extends $AsyncNotifierProvider<SvgAssetBase64SrcProvider, String> {
  const SvgAssetBase64SrcProviderProvider._({
    required SvgAssetBase64SrcProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'svgAssetBase64SrcProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$svgAssetBase64SrcProviderHash();

  @override
  String toString() {
    return r'svgAssetBase64SrcProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SvgAssetBase64SrcProvider create() => SvgAssetBase64SrcProvider();

  @override
  bool operator ==(Object other) {
    return other is SvgAssetBase64SrcProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$svgAssetBase64SrcProviderHash() =>
    r'8ae96956bfc12ab7c8f02d30197d162911ae453b';

final class SvgAssetBase64SrcProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          SvgAssetBase64SrcProvider,
          AsyncValue<String>,
          String,
          FutureOr<String>,
          String
        > {
  const SvgAssetBase64SrcProviderFamily._()
    : super(
        retry: null,
        name: r'svgAssetBase64SrcProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SvgAssetBase64SrcProviderProvider call({required String svgAsset}) =>
      SvgAssetBase64SrcProviderProvider._(argument: svgAsset, from: this);

  @override
  String toString() => r'svgAssetBase64SrcProvider';
}

abstract class _$SvgAssetBase64SrcProvider extends $AsyncNotifier<String> {
  late final _$args = ref.$arg as String;
  String get svgAsset => _$args;

  FutureOr<String> build({required String svgAsset});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(svgAsset: _$args);
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
