// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SttProvider)
const sttProvider = SttProviderProvider._();

final class SttProviderProvider
    extends $AsyncNotifierProvider<SttProvider, Stt> {
  const SttProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sttProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sttProviderHash();

  @$internal
  @override
  SttProvider create() => SttProvider();
}

String _$sttProviderHash() => r'6f0ac4dc5ed66ffc1a598ee61de19e43b2ddb1f4';

abstract class _$SttProvider extends $AsyncNotifier<Stt> {
  FutureOr<Stt> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Stt>, Stt>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Stt>, Stt>,
              AsyncValue<Stt>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
