// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_as_html_string_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$svgAsHtmlStringProviderHash() =>
    r'182c0a15407a46b916e40fa9f1bf71a710e4d9fe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SvgAsHtmlStringProvider
    extends BuildlessAutoDisposeAsyncNotifier<(String?, Size?)> {
  late final String svgLink;
  late final Map<String, String>? headers;
  late final AlignmentGeometry alignment;
  late final Color backgroundColor;
  late final bool fillContainer;
  late final BoxFit fit;

  FutureOr<(String?, Size?)> build({
    required String svgLink,
    Map<String, String>? headers,
    AlignmentGeometry alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    bool fillContainer = false,
    BoxFit fit = BoxFit.contain,
  });
}

/// See also [SvgAsHtmlStringProvider].
@ProviderFor(SvgAsHtmlStringProvider)
const svgAsHtmlStringProvider = SvgAsHtmlStringProviderFamily();

/// See also [SvgAsHtmlStringProvider].
class SvgAsHtmlStringProviderFamily
    extends Family<AsyncValue<(String?, Size?)>> {
  /// See also [SvgAsHtmlStringProvider].
  const SvgAsHtmlStringProviderFamily();

  /// See also [SvgAsHtmlStringProvider].
  SvgAsHtmlStringProviderProvider call({
    required String svgLink,
    Map<String, String>? headers,
    AlignmentGeometry alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    bool fillContainer = false,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgAsHtmlStringProviderProvider(
      svgLink: svgLink,
      headers: headers,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fillContainer: fillContainer,
      fit: fit,
    );
  }

  @override
  SvgAsHtmlStringProviderProvider getProviderOverride(
    covariant SvgAsHtmlStringProviderProvider provider,
  ) {
    return call(
      svgLink: provider.svgLink,
      headers: provider.headers,
      alignment: provider.alignment,
      backgroundColor: provider.backgroundColor,
      fillContainer: provider.fillContainer,
      fit: provider.fit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'svgAsHtmlStringProvider';
}

/// See also [SvgAsHtmlStringProvider].
class SvgAsHtmlStringProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SvgAsHtmlStringProvider,
        (String?, Size?)> {
  /// See also [SvgAsHtmlStringProvider].
  SvgAsHtmlStringProviderProvider({
    required String svgLink,
    Map<String, String>? headers,
    AlignmentGeometry alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    bool fillContainer = false,
    BoxFit fit = BoxFit.contain,
  }) : this._internal(
          () => SvgAsHtmlStringProvider()
            ..svgLink = svgLink
            ..headers = headers
            ..alignment = alignment
            ..backgroundColor = backgroundColor
            ..fillContainer = fillContainer
            ..fit = fit,
          from: svgAsHtmlStringProvider,
          name: r'svgAsHtmlStringProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$svgAsHtmlStringProviderHash,
          dependencies: SvgAsHtmlStringProviderFamily._dependencies,
          allTransitiveDependencies:
              SvgAsHtmlStringProviderFamily._allTransitiveDependencies,
          svgLink: svgLink,
          headers: headers,
          alignment: alignment,
          backgroundColor: backgroundColor,
          fillContainer: fillContainer,
          fit: fit,
        );

  SvgAsHtmlStringProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.svgLink,
    required this.headers,
    required this.alignment,
    required this.backgroundColor,
    required this.fillContainer,
    required this.fit,
  }) : super.internal();

  final String svgLink;
  final Map<String, String>? headers;
  final AlignmentGeometry alignment;
  final Color backgroundColor;
  final bool fillContainer;
  final BoxFit fit;

  @override
  FutureOr<(String?, Size?)> runNotifierBuild(
    covariant SvgAsHtmlStringProvider notifier,
  ) {
    return notifier.build(
      svgLink: svgLink,
      headers: headers,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fillContainer: fillContainer,
      fit: fit,
    );
  }

  @override
  Override overrideWith(SvgAsHtmlStringProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SvgAsHtmlStringProviderProvider._internal(
        () => create()
          ..svgLink = svgLink
          ..headers = headers
          ..alignment = alignment
          ..backgroundColor = backgroundColor
          ..fillContainer = fillContainer
          ..fit = fit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        svgLink: svgLink,
        headers: headers,
        alignment: alignment,
        backgroundColor: backgroundColor,
        fillContainer: fillContainer,
        fit: fit,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SvgAsHtmlStringProvider,
      (String?, Size?)> createElement() {
    return _SvgAsHtmlStringProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SvgAsHtmlStringProviderProvider &&
        other.svgLink == svgLink &&
        other.headers == headers &&
        other.alignment == alignment &&
        other.backgroundColor == backgroundColor &&
        other.fillContainer == fillContainer &&
        other.fit == fit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, svgLink.hashCode);
    hash = _SystemHash.combine(hash, headers.hashCode);
    hash = _SystemHash.combine(hash, alignment.hashCode);
    hash = _SystemHash.combine(hash, backgroundColor.hashCode);
    hash = _SystemHash.combine(hash, fillContainer.hashCode);
    hash = _SystemHash.combine(hash, fit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SvgAsHtmlStringProviderRef
    on AutoDisposeAsyncNotifierProviderRef<(String?, Size?)> {
  /// The parameter `svgLink` of this provider.
  String get svgLink;

  /// The parameter `headers` of this provider.
  Map<String, String>? get headers;

  /// The parameter `alignment` of this provider.
  AlignmentGeometry get alignment;

  /// The parameter `backgroundColor` of this provider.
  Color get backgroundColor;

  /// The parameter `fillContainer` of this provider.
  bool get fillContainer;

  /// The parameter `fit` of this provider.
  BoxFit get fit;
}

class _SvgAsHtmlStringProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SvgAsHtmlStringProvider,
        (String?, Size?)> with SvgAsHtmlStringProviderRef {
  _SvgAsHtmlStringProviderProviderElement(super.provider);

  @override
  String get svgLink => (origin as SvgAsHtmlStringProviderProvider).svgLink;
  @override
  Map<String, String>? get headers =>
      (origin as SvgAsHtmlStringProviderProvider).headers;
  @override
  AlignmentGeometry get alignment =>
      (origin as SvgAsHtmlStringProviderProvider).alignment;
  @override
  Color get backgroundColor =>
      (origin as SvgAsHtmlStringProviderProvider).backgroundColor;
  @override
  bool get fillContainer =>
      (origin as SvgAsHtmlStringProviderProvider).fillContainer;
  @override
  BoxFit get fit => (origin as SvgAsHtmlStringProviderProvider).fit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
