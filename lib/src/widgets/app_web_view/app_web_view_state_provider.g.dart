// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_web_view_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appWebViewStateProviderHash() =>
    r'e224b2be0dc24de2700487a62af813de19423ce1';

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

abstract class _$AppWebViewStateProvider
    extends BuildlessAutoDisposeNotifier<AppWebViewState> {
  late final AppWebViewState? initialState;
  late final int? id;
  late final String? initialUrl;
  late final String? title;
  late final Set<String>? javaScriptChannelNames;
  late final bool Function(String, bool)? allowNavigation;

  AppWebViewState build({
    AppWebViewState? initialState,
    int? id,
    String? initialUrl,
    String? title,
    Set<String>? javaScriptChannelNames,
    bool Function(String, bool)? allowNavigation,
  });
}

/// See also [AppWebViewStateProvider].
@ProviderFor(AppWebViewStateProvider)
const appWebViewStateProvider = AppWebViewStateProviderFamily();

/// See also [AppWebViewStateProvider].
class AppWebViewStateProviderFamily extends Family<AppWebViewState> {
  /// See also [AppWebViewStateProvider].
  const AppWebViewStateProviderFamily();

  /// See also [AppWebViewStateProvider].
  AppWebViewStateProviderProvider call({
    AppWebViewState? initialState,
    int? id,
    String? initialUrl,
    String? title,
    Set<String>? javaScriptChannelNames,
    bool Function(String, bool)? allowNavigation,
  }) {
    return AppWebViewStateProviderProvider(
      initialState: initialState,
      id: id,
      initialUrl: initialUrl,
      title: title,
      javaScriptChannelNames: javaScriptChannelNames,
      allowNavigation: allowNavigation,
    );
  }

  @override
  AppWebViewStateProviderProvider getProviderOverride(
    covariant AppWebViewStateProviderProvider provider,
  ) {
    return call(
      initialState: provider.initialState,
      id: provider.id,
      initialUrl: provider.initialUrl,
      title: provider.title,
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
  String? get name => r'appWebViewStateProvider';
}

/// See also [AppWebViewStateProvider].
class AppWebViewStateProviderProvider
    extends
        AutoDisposeNotifierProviderImpl<
          AppWebViewStateProvider,
          AppWebViewState
        > {
  /// See also [AppWebViewStateProvider].
  AppWebViewStateProviderProvider({
    AppWebViewState? initialState,
    int? id,
    String? initialUrl,
    String? title,
    Set<String>? javaScriptChannelNames,
    bool Function(String, bool)? allowNavigation,
  }) : this._internal(
         () =>
             AppWebViewStateProvider()
               ..initialState = initialState
               ..id = id
               ..initialUrl = initialUrl
               ..title = title
               ..javaScriptChannelNames = javaScriptChannelNames
               ..allowNavigation = allowNavigation,
         from: appWebViewStateProvider,
         name: r'appWebViewStateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$appWebViewStateProviderHash,
         dependencies: AppWebViewStateProviderFamily._dependencies,
         allTransitiveDependencies:
             AppWebViewStateProviderFamily._allTransitiveDependencies,
         initialState: initialState,
         id: id,
         initialUrl: initialUrl,
         title: title,
         javaScriptChannelNames: javaScriptChannelNames,
         allowNavigation: allowNavigation,
       );

  AppWebViewStateProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialState,
    required this.id,
    required this.initialUrl,
    required this.title,
    required this.javaScriptChannelNames,
    required this.allowNavigation,
  }) : super.internal();

  final AppWebViewState? initialState;
  final int? id;
  final String? initialUrl;
  final String? title;
  final Set<String>? javaScriptChannelNames;
  final bool Function(String, bool)? allowNavigation;

  @override
  AppWebViewState runNotifierBuild(covariant AppWebViewStateProvider notifier) {
    return notifier.build(
      initialState: initialState,
      id: id,
      initialUrl: initialUrl,
      title: title,
      javaScriptChannelNames: javaScriptChannelNames,
      allowNavigation: allowNavigation,
    );
  }

  @override
  Override overrideWith(AppWebViewStateProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppWebViewStateProviderProvider._internal(
        () =>
            create()
              ..initialState = initialState
              ..id = id
              ..initialUrl = initialUrl
              ..title = title
              ..javaScriptChannelNames = javaScriptChannelNames
              ..allowNavigation = allowNavigation,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialState: initialState,
        id: id,
        initialUrl: initialUrl,
        title: title,
        javaScriptChannelNames: javaScriptChannelNames,
        allowNavigation: allowNavigation,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AppWebViewStateProvider, AppWebViewState>
  createElement() {
    return _AppWebViewStateProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppWebViewStateProviderProvider &&
        other.initialState == initialState &&
        other.id == id &&
        other.initialUrl == initialUrl &&
        other.title == title &&
        other.javaScriptChannelNames == javaScriptChannelNames &&
        other.allowNavigation == allowNavigation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialState.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, initialUrl.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, javaScriptChannelNames.hashCode);
    hash = _SystemHash.combine(hash, allowNavigation.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppWebViewStateProviderRef
    on AutoDisposeNotifierProviderRef<AppWebViewState> {
  /// The parameter `initialState` of this provider.
  AppWebViewState? get initialState;

  /// The parameter `id` of this provider.
  int? get id;

  /// The parameter `initialUrl` of this provider.
  String? get initialUrl;

  /// The parameter `title` of this provider.
  String? get title;

  /// The parameter `javaScriptChannelNames` of this provider.
  Set<String>? get javaScriptChannelNames;

  /// The parameter `allowNavigation` of this provider.
  bool Function(String, bool)? get allowNavigation;
}

class _AppWebViewStateProviderProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          AppWebViewStateProvider,
          AppWebViewState
        >
    with AppWebViewStateProviderRef {
  _AppWebViewStateProviderProviderElement(super.provider);

  @override
  AppWebViewState? get initialState =>
      (origin as AppWebViewStateProviderProvider).initialState;
  @override
  int? get id => (origin as AppWebViewStateProviderProvider).id;
  @override
  String? get initialUrl =>
      (origin as AppWebViewStateProviderProvider).initialUrl;
  @override
  String? get title => (origin as AppWebViewStateProviderProvider).title;
  @override
  Set<String>? get javaScriptChannelNames =>
      (origin as AppWebViewStateProviderProvider).javaScriptChannelNames;
  @override
  bool Function(String, bool)? get allowNavigation =>
      (origin as AppWebViewStateProviderProvider).allowNavigation;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
