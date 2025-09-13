// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_as_html_string_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SvgAsHtmlStringProvider)
const svgAsHtmlStringProvider = SvgAsHtmlStringProviderFamily._();

final class SvgAsHtmlStringProviderProvider
    extends $AsyncNotifierProvider<SvgAsHtmlStringProvider, (String?, Size?)> {
  const SvgAsHtmlStringProviderProvider._({
    required SvgAsHtmlStringProviderFamily super.from,
    required ({
      String svgLink,
      Map<String, String>? headers,
      AlignmentGeometry alignment,
      Color backgroundColor,
      bool fillContainer,
      BoxFit fit,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'svgAsHtmlStringProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$svgAsHtmlStringProviderHash();

  @override
  String toString() {
    return r'svgAsHtmlStringProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SvgAsHtmlStringProvider create() => SvgAsHtmlStringProvider();

  @override
  bool operator ==(Object other) {
    return other is SvgAsHtmlStringProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$svgAsHtmlStringProviderHash() =>
    r'182c0a15407a46b916e40fa9f1bf71a710e4d9fe';

final class SvgAsHtmlStringProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          SvgAsHtmlStringProvider,
          AsyncValue<(String?, Size?)>,
          (String?, Size?),
          FutureOr<(String?, Size?)>,
          ({
            String svgLink,
            Map<String, String>? headers,
            AlignmentGeometry alignment,
            Color backgroundColor,
            bool fillContainer,
            BoxFit fit,
          })
        > {
  const SvgAsHtmlStringProviderFamily._()
    : super(
        retry: null,
        name: r'svgAsHtmlStringProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SvgAsHtmlStringProviderProvider call({
    required String svgLink,
    Map<String, String>? headers,
    AlignmentGeometry alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    bool fillContainer = false,
    BoxFit fit = BoxFit.contain,
  }) => SvgAsHtmlStringProviderProvider._(
    argument: (
      svgLink: svgLink,
      headers: headers,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fillContainer: fillContainer,
      fit: fit,
    ),
    from: this,
  );

  @override
  String toString() => r'svgAsHtmlStringProvider';
}

abstract class _$SvgAsHtmlStringProvider
    extends $AsyncNotifier<(String?, Size?)> {
  late final _$args =
      ref.$arg
          as ({
            String svgLink,
            Map<String, String>? headers,
            AlignmentGeometry alignment,
            Color backgroundColor,
            bool fillContainer,
            BoxFit fit,
          });
  String get svgLink => _$args.svgLink;
  Map<String, String>? get headers => _$args.headers;
  AlignmentGeometry get alignment => _$args.alignment;
  Color get backgroundColor => _$args.backgroundColor;
  bool get fillContainer => _$args.fillContainer;
  BoxFit get fit => _$args.fit;

  FutureOr<(String?, Size?)> build({
    required String svgLink,
    Map<String, String>? headers,
    AlignmentGeometry alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    bool fillContainer = false,
    BoxFit fit = BoxFit.contain,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      svgLink: _$args.svgLink,
      headers: _$args.headers,
      alignment: _$args.alignment,
      backgroundColor: _$args.backgroundColor,
      fillContainer: _$args.fillContainer,
      fit: _$args.fit,
    );
    final ref =
        this.ref as $Ref<AsyncValue<(String?, Size?)>, (String?, Size?)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<(String?, Size?)>, (String?, Size?)>,
              AsyncValue<(String?, Size?)>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
