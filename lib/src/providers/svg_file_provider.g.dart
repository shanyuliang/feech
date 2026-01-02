// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SvgFileProvider)
final svgFileProvider = SvgFileProviderFamily._();

final class SvgFileProviderProvider
    extends $StreamNotifierProvider<SvgFileProvider, (String, File?)> {
  SvgFileProviderProvider._({
    required SvgFileProviderFamily super.from,
    required ({
      AppCacheManager appCacheManager,
      String svgLink,
      Map<String, String>? headers,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'svgFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$svgFileProviderHash();

  @override
  String toString() {
    return r'svgFileProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SvgFileProvider create() => SvgFileProvider();

  @override
  bool operator ==(Object other) {
    return other is SvgFileProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$svgFileProviderHash() => r'ec7133742a96350e60416587c50f64e6025401f2';

final class SvgFileProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          SvgFileProvider,
          AsyncValue<(String, File?)>,
          (String, File?),
          Stream<(String, File?)>,
          ({
            AppCacheManager appCacheManager,
            String svgLink,
            Map<String, String>? headers,
          })
        > {
  SvgFileProviderFamily._()
    : super(
        retry: null,
        name: r'svgFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SvgFileProviderProvider call({
    required AppCacheManager appCacheManager,
    required String svgLink,
    Map<String, String>? headers,
  }) => SvgFileProviderProvider._(
    argument: (
      appCacheManager: appCacheManager,
      svgLink: svgLink,
      headers: headers,
    ),
    from: this,
  );

  @override
  String toString() => r'svgFileProvider';
}

abstract class _$SvgFileProvider extends $StreamNotifier<(String, File?)> {
  late final _$args =
      ref.$arg
          as ({
            AppCacheManager appCacheManager,
            String svgLink,
            Map<String, String>? headers,
          });
  AppCacheManager get appCacheManager => _$args.appCacheManager;
  String get svgLink => _$args.svgLink;
  Map<String, String>? get headers => _$args.headers;

  Stream<(String, File?)> build({
    required AppCacheManager appCacheManager,
    required String svgLink,
    Map<String, String>? headers,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<(String, File?)>, (String, File?)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<(String, File?)>, (String, File?)>,
              AsyncValue<(String, File?)>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        appCacheManager: _$args.appCacheManager,
        svgLink: _$args.svgLink,
        headers: _$args.headers,
      ),
    );
  }
}
