// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_lifecycle_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PageLifecycleStateProvider)
final pageLifecycleStateProvider = PageLifecycleStateProviderFamily._();

final class PageLifecycleStateProviderProvider
    extends $NotifierProvider<PageLifecycleStateProvider, PageLifecycleState> {
  PageLifecycleStateProviderProvider._({
    required PageLifecycleStateProviderFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'pageLifecycleStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pageLifecycleStateProviderHash();

  @override
  String toString() {
    return r'pageLifecycleStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PageLifecycleStateProvider create() => PageLifecycleStateProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PageLifecycleState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PageLifecycleState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PageLifecycleStateProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pageLifecycleStateProviderHash() =>
    r'56f4fd4df9420cb133437ae6569aa3eb620cb6b6';

final class PageLifecycleStateProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          PageLifecycleStateProvider,
          PageLifecycleState,
          PageLifecycleState,
          PageLifecycleState,
          String?
        > {
  PageLifecycleStateProviderFamily._()
    : super(
        retry: null,
        name: r'pageLifecycleStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PageLifecycleStateProviderProvider call(String? routeName) =>
      PageLifecycleStateProviderProvider._(argument: routeName, from: this);

  @override
  String toString() => r'pageLifecycleStateProvider';
}

abstract class _$PageLifecycleStateProvider
    extends $Notifier<PageLifecycleState> {
  late final _$args = ref.$arg as String?;
  String? get routeName => _$args;

  PageLifecycleState build(String? routeName);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PageLifecycleState, PageLifecycleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PageLifecycleState, PageLifecycleState>,
              PageLifecycleState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
