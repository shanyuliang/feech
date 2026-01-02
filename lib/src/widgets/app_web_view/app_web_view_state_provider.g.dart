// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_web_view_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppWebViewStateProvider)
final appWebViewStateProvider = AppWebViewStateProviderFamily._();

final class AppWebViewStateProviderProvider
    extends $NotifierProvider<AppWebViewStateProvider, AppWebViewState> {
  AppWebViewStateProviderProvider._({
    required AppWebViewStateProviderFamily super.from,
    required ({
      AppWebViewState? initialState,
      int? id,
      String? initialUrl,
      String? title,
      Set<String>? javaScriptChannelNames,
      bool Function(String url, bool isMainFrame)? allowNavigation,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'appWebViewStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appWebViewStateProviderHash();

  @override
  String toString() {
    return r'appWebViewStateProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AppWebViewStateProvider create() => AppWebViewStateProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppWebViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppWebViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AppWebViewStateProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$appWebViewStateProviderHash() =>
    r'e224b2be0dc24de2700487a62af813de19423ce1';

final class AppWebViewStateProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          AppWebViewStateProvider,
          AppWebViewState,
          AppWebViewState,
          AppWebViewState,
          ({
            AppWebViewState? initialState,
            int? id,
            String? initialUrl,
            String? title,
            Set<String>? javaScriptChannelNames,
            bool Function(String url, bool isMainFrame)? allowNavigation,
          })
        > {
  AppWebViewStateProviderFamily._()
    : super(
        retry: null,
        name: r'appWebViewStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AppWebViewStateProviderProvider call({
    AppWebViewState? initialState,
    int? id,
    String? initialUrl,
    String? title,
    Set<String>? javaScriptChannelNames,
    bool Function(String url, bool isMainFrame)? allowNavigation,
  }) => AppWebViewStateProviderProvider._(
    argument: (
      initialState: initialState,
      id: id,
      initialUrl: initialUrl,
      title: title,
      javaScriptChannelNames: javaScriptChannelNames,
      allowNavigation: allowNavigation,
    ),
    from: this,
  );

  @override
  String toString() => r'appWebViewStateProvider';
}

abstract class _$AppWebViewStateProvider extends $Notifier<AppWebViewState> {
  late final _$args =
      ref.$arg
          as ({
            AppWebViewState? initialState,
            int? id,
            String? initialUrl,
            String? title,
            Set<String>? javaScriptChannelNames,
            bool Function(String url, bool isMainFrame)? allowNavigation,
          });
  AppWebViewState? get initialState => _$args.initialState;
  int? get id => _$args.id;
  String? get initialUrl => _$args.initialUrl;
  String? get title => _$args.title;
  Set<String>? get javaScriptChannelNames => _$args.javaScriptChannelNames;
  bool Function(String url, bool isMainFrame)? get allowNavigation =>
      _$args.allowNavigation;

  AppWebViewState build({
    AppWebViewState? initialState,
    int? id,
    String? initialUrl,
    String? title,
    Set<String>? javaScriptChannelNames,
    bool Function(String url, bool isMainFrame)? allowNavigation,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppWebViewState, AppWebViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppWebViewState, AppWebViewState>,
              AppWebViewState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        initialState: _$args.initialState,
        id: _$args.id,
        initialUrl: _$args.initialUrl,
        title: _$args.title,
        javaScriptChannelNames: _$args.javaScriptChannelNames,
        allowNavigation: _$args.allowNavigation,
      ),
    );
  }
}
