// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_web_view_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appWebViewHash() => r'5851f581764092b397f83bbf535a54d2187d3284';

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

abstract class _$AppWebView
    extends BuildlessAutoDisposeNotifier<AppWebViewState> {
  late final AppWebViewState? initialState;
  late final Set<String>? javaScriptChannelNames;
  late final bool Function(String, bool)? allowNavigation;

  AppWebViewState build({
    AppWebViewState? initialState,
    Set<String>? javaScriptChannelNames,
    bool Function(String, bool)? allowNavigation,
  });
}

/// See also [AppWebView].
@ProviderFor(AppWebView)
const appWebViewProvider = AppWebViewFamily();

/// See also [AppWebView].
class AppWebViewFamily extends Family<AppWebViewState> {
  /// See also [AppWebView].
  const AppWebViewFamily();

  /// See also [AppWebView].
  AppWebViewProvider call({
    AppWebViewState? initialState,
    Set<String>? javaScriptChannelNames,
    bool Function(String, bool)? allowNavigation,
  }) {
    return AppWebViewProvider(
      initialState: initialState,
      javaScriptChannelNames: javaScriptChannelNames,
      allowNavigation: allowNavigation,
    );
  }

  @override
  AppWebViewProvider getProviderOverride(
    covariant AppWebViewProvider provider,
  ) {
    return call(
      initialState: provider.initialState,
      javaScriptChannelNames: provider.javaScriptChannelNames,
      allowNavigation: provider.allowNavigation,
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
  String? get name => r'appWebViewProvider';
}

/// See also [AppWebView].
class AppWebViewProvider
    extends AutoDisposeNotifierProviderImpl<AppWebView, AppWebViewState> {
  /// See also [AppWebView].
  AppWebViewProvider({
    AppWebViewState? initialState,
    Set<String>? javaScriptChannelNames,
    bool Function(String, bool)? allowNavigation,
  }) : this._internal(
          () => AppWebView()
            ..initialState = initialState
            ..javaScriptChannelNames = javaScriptChannelNames
            ..allowNavigation = allowNavigation,
          from: appWebViewProvider,
          name: r'appWebViewProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appWebViewHash,
          dependencies: AppWebViewFamily._dependencies,
          allTransitiveDependencies:
              AppWebViewFamily._allTransitiveDependencies,
          initialState: initialState,
          javaScriptChannelNames: javaScriptChannelNames,
          allowNavigation: allowNavigation,
        );

  AppWebViewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialState,
    required this.javaScriptChannelNames,
    required this.allowNavigation,
  }) : super.internal();

  final AppWebViewState? initialState;
  final Set<String>? javaScriptChannelNames;
  final bool Function(String, bool)? allowNavigation;

  @override
  AppWebViewState runNotifierBuild(
    covariant AppWebView notifier,
  ) {
    return notifier.build(
      initialState: initialState,
      javaScriptChannelNames: javaScriptChannelNames,
      allowNavigation: allowNavigation,
    );
  }

  @override
  Override overrideWith(AppWebView Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppWebViewProvider._internal(
        () => create()
          ..initialState = initialState
          ..javaScriptChannelNames = javaScriptChannelNames
          ..allowNavigation = allowNavigation,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialState: initialState,
        javaScriptChannelNames: javaScriptChannelNames,
        allowNavigation: allowNavigation,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppWebView, AppWebViewState>
      createElement() {
    return _AppWebViewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppWebViewProvider &&
        other.initialState == initialState &&
        other.javaScriptChannelNames == javaScriptChannelNames &&
        other.allowNavigation == allowNavigation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialState.hashCode);
    hash = _SystemHash.combine(hash, javaScriptChannelNames.hashCode);
    hash = _SystemHash.combine(hash, allowNavigation.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppWebViewRef on AutoDisposeNotifierProviderRef<AppWebViewState> {
  /// The parameter `initialState` of this provider.
  AppWebViewState? get initialState;

  /// The parameter `javaScriptChannelNames` of this provider.
  Set<String>? get javaScriptChannelNames;

  /// The parameter `allowNavigation` of this provider.
  bool Function(String, bool)? get allowNavigation;
}

class _AppWebViewProviderElement
    extends AutoDisposeNotifierProviderElement<AppWebView, AppWebViewState>
    with AppWebViewRef {
  _AppWebViewProviderElement(super.provider);

  @override
  AppWebViewState? get initialState =>
      (origin as AppWebViewProvider).initialState;
  @override
  Set<String>? get javaScriptChannelNames =>
      (origin as AppWebViewProvider).javaScriptChannelNames;
  @override
  bool Function(String, bool)? get allowNavigation =>
      (origin as AppWebViewProvider).allowNavigation;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
