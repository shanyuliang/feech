// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'svg_as_html_string_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$svgAsHtmlStringProviderHash() =>
    r'95740536006409b0165957fa605caf2e87696804';

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
    extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String svgLink;
  late final Alignment alignment;
  late final Color backgroundColor;
  late final BoxFit fit;
  late final bool fillContainer;

  FutureOr<String> build({
    required String svgLink,
    Alignment alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    bool fillContainer = false,
  });
}

/// See also [SvgAsHtmlStringProvider].
@ProviderFor(SvgAsHtmlStringProvider)
const svgAsHtmlStringProvider = SvgAsHtmlStringProviderFamily();

/// See also [SvgAsHtmlStringProvider].
class SvgAsHtmlStringProviderFamily extends Family<AsyncValue<String>> {
  /// See also [SvgAsHtmlStringProvider].
  const SvgAsHtmlStringProviderFamily();

  /// See also [SvgAsHtmlStringProvider].
  SvgAsHtmlStringProviderProvider call({
    required String svgLink,
    Alignment alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    bool fillContainer = false,
  }) {
    return SvgAsHtmlStringProviderProvider(
      svgLink: svgLink,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fit: fit,
      fillContainer: fillContainer,
    );
  }

  @override
  SvgAsHtmlStringProviderProvider getProviderOverride(
    covariant SvgAsHtmlStringProviderProvider provider,
  ) {
    return call(
      svgLink: provider.svgLink,
      alignment: provider.alignment,
      backgroundColor: provider.backgroundColor,
      fit: provider.fit,
      fillContainer: provider.fillContainer,
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
        String> {
  /// See also [SvgAsHtmlStringProvider].
  SvgAsHtmlStringProviderProvider({
    required String svgLink,
    Alignment alignment = Alignment.center,
    Color backgroundColor = Colors.transparent,
    BoxFit fit = BoxFit.contain,
    bool fillContainer = false,
  }) : this._internal(
          () => SvgAsHtmlStringProvider()
            ..svgLink = svgLink
            ..alignment = alignment
            ..backgroundColor = backgroundColor
            ..fit = fit
            ..fillContainer = fillContainer,
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
          alignment: alignment,
          backgroundColor: backgroundColor,
          fit: fit,
          fillContainer: fillContainer,
        );

  SvgAsHtmlStringProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.svgLink,
    required this.alignment,
    required this.backgroundColor,
    required this.fit,
    required this.fillContainer,
  }) : super.internal();

  final String svgLink;
  final Alignment alignment;
  final Color backgroundColor;
  final BoxFit fit;
  final bool fillContainer;

  @override
  FutureOr<String> runNotifierBuild(
    covariant SvgAsHtmlStringProvider notifier,
  ) {
    return notifier.build(
      svgLink: svgLink,
      alignment: alignment,
      backgroundColor: backgroundColor,
      fit: fit,
      fillContainer: fillContainer,
    );
  }

  @override
  Override overrideWith(SvgAsHtmlStringProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: SvgAsHtmlStringProviderProvider._internal(
        () => create()
          ..svgLink = svgLink
          ..alignment = alignment
          ..backgroundColor = backgroundColor
          ..fit = fit
          ..fillContainer = fillContainer,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        svgLink: svgLink,
        alignment: alignment,
        backgroundColor: backgroundColor,
        fit: fit,
        fillContainer: fillContainer,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SvgAsHtmlStringProvider, String>
      createElement() {
    return _SvgAsHtmlStringProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SvgAsHtmlStringProviderProvider &&
        other.svgLink == svgLink &&
        other.alignment == alignment &&
        other.backgroundColor == backgroundColor &&
        other.fit == fit &&
        other.fillContainer == fillContainer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, svgLink.hashCode);
    hash = _SystemHash.combine(hash, alignment.hashCode);
    hash = _SystemHash.combine(hash, backgroundColor.hashCode);
    hash = _SystemHash.combine(hash, fit.hashCode);
    hash = _SystemHash.combine(hash, fillContainer.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SvgAsHtmlStringProviderRef
    on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `svgLink` of this provider.
  String get svgLink;

  /// The parameter `alignment` of this provider.
  Alignment get alignment;

  /// The parameter `backgroundColor` of this provider.
  Color get backgroundColor;

  /// The parameter `fit` of this provider.
  BoxFit get fit;

  /// The parameter `fillContainer` of this provider.
  bool get fillContainer;
}

class _SvgAsHtmlStringProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SvgAsHtmlStringProvider,
        String> with SvgAsHtmlStringProviderRef {
  _SvgAsHtmlStringProviderProviderElement(super.provider);

  @override
  String get svgLink => (origin as SvgAsHtmlStringProviderProvider).svgLink;
  @override
  Alignment get alignment =>
      (origin as SvgAsHtmlStringProviderProvider).alignment;
  @override
  Color get backgroundColor =>
      (origin as SvgAsHtmlStringProviderProvider).backgroundColor;
  @override
  BoxFit get fit => (origin as SvgAsHtmlStringProviderProvider).fit;
  @override
  bool get fillContainer =>
      (origin as SvgAsHtmlStringProviderProvider).fillContainer;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
