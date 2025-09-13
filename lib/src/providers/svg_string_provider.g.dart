// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_string_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SvgStringProvider)
const svgStringProvider = SvgStringProviderFamily._();

final class SvgStringProviderProvider
    extends $AsyncNotifierProvider<SvgStringProvider, String?> {
  const SvgStringProviderProvider._({
    required SvgStringProviderFamily super.from,
    required ({String svgLink, Map<String, String>? headers}) super.argument,
  }) : super(
         retry: null,
         name: r'svgStringProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$svgStringProviderHash();

  @override
  String toString() {
    return r'svgStringProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SvgStringProvider create() => SvgStringProvider();

  @override
  bool operator ==(Object other) {
    return other is SvgStringProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$svgStringProviderHash() => r'd684d4a6346625503b26536707420325bef1963d';

final class SvgStringProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          SvgStringProvider,
          AsyncValue<String?>,
          String?,
          FutureOr<String?>,
          ({String svgLink, Map<String, String>? headers})
        > {
  const SvgStringProviderFamily._()
    : super(
        retry: null,
        name: r'svgStringProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SvgStringProviderProvider call({
    required String svgLink,
    Map<String, String>? headers,
  }) => SvgStringProviderProvider._(
    argument: (svgLink: svgLink, headers: headers),
    from: this,
  );

  @override
  String toString() => r'svgStringProvider';
}

abstract class _$SvgStringProvider extends $AsyncNotifier<String?> {
  late final _$args =
      ref.$arg as ({String svgLink, Map<String, String>? headers});
  String get svgLink => _$args.svgLink;
  Map<String, String>? get headers => _$args.headers;

  FutureOr<String?> build({
    required String svgLink,
    Map<String, String>? headers,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(svgLink: _$args.svgLink, headers: _$args.headers);
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
