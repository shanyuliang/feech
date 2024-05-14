import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class AppProviderObserver extends ProviderObserver {
  final bool debugLogDiagnostics;

  AppProviderObserver({this.debugLogDiagnostics = false});

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    if (debugLogDiagnostics) {
      developer.log('Provider $provider was initialized with $value', name: debugTag);
    }
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    if (debugLogDiagnostics) {
      developer.log('Provider $provider was disposed', name: debugTag);
    }
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    if (debugLogDiagnostics) {
      developer.log('Provider $provider updated\nfrom\n$previousValue\nto\n$newValue', name: debugTag);
    }
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    if (debugLogDiagnostics) {
      developer.log('Provider $provider threw $error at $stackTrace', name: debugTag);
    }
  }
}
