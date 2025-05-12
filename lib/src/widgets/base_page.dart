import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../providers/app_lifecycle_state_provider/app_lifecycle_state_provider.dart';
import '../models/page_lifecycle_state.dart';
import '../providers/page_lifecycle_state_provider/page_lifecycle_state_provider.dart';
import '../providers/page_title_provider/page_title_provider.dart';
import '../utilities/handy_util.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  final bool debugLogDiagnostics;

  final String? routeName;

  final String initialTitle;

  const BasePage({super.key, this.routeName, this.initialTitle = '', this.debugLogDiagnostics = false});

  Widget build(BuildContext context, WidgetRef ref);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasePageState();

  void setTitle(WidgetRef ref, String title) {
    ref.read(pageTitleProvider(routeName).notifier).setTitle(title);
  }

  String getTitle(WidgetRef? ref) {
    return ref?.let((it) => it.read(pageTitleProvider(routeName))) ?? initialTitle;
  }

  void initialise(WidgetRef ref) {}

  void didChangeDependencies(BuildContext context, WidgetRef ref) {}

  void onDisposed(BuildContext context, WidgetRef ref) {}

  void onAppResumed(BuildContext context, WidgetRef ref) {}

  void onAppPaused(BuildContext context, WidgetRef ref) {}

  void onAppDetached(BuildContext context, WidgetRef ref) {}

  void onPageResumed(BuildContext context, WidgetRef ref) {}

  void onPagePaused(BuildContext context, WidgetRef ref) {}
}

class _BasePageState extends ConsumerState<BasePage> {
  @override
  void initState() {
    super.initState();
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page initialise", name: debugTag);
    }
    widget.initialise(ref);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page didChangeDependencies", name: debugTag);
    }
    widget.didChangeDependencies(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page build", name: debugTag);
    }
    ref.listen(
      appLifecycleStateProvider,
      (previous, next) {
        switch (next) {
          case AppLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("${widget.routeName}[${widget.key}] app resumed", name: debugTag);
            }
            widget.onAppResumed(context, ref);
            break;
          case AppLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("${widget.routeName}[${widget.key}] app paused", name: debugTag);
            }
            widget.onAppPaused(context, ref);
            break;
          case AppLifecycleState.detached:
            if (widget.debugLogDiagnostics) {
              developer.log("${widget.routeName}[${widget.key}] app detached", name: debugTag);
            }
            widget.onAppDetached(context, ref);
            break;
          default:
            break;
        }
      },
    );
    widget.routeName?.let(
      (it) {
        ref.listen(
          pageLifecycleStateProvider(it),
          (previous, next) {
            switch (next) {
              case PageLifecycleState.resumed:
                if (widget.debugLogDiagnostics) {
                  developer.log("${widget.routeName}[${widget.key}] page resumed", name: debugTag);
                }
                _refreshTitle();
                widget.onPageResumed(context, ref);
                break;
              case PageLifecycleState.paused:
                if (widget.debugLogDiagnostics) {
                  developer.log("${widget.routeName}[${widget.key}] page paused", name: debugTag);
                }
                widget.onPagePaused(context, ref);
                break;
              default:
                break;
            }
          },
        );
        ref.listen(
          pageTitleProvider(it),
          (previous, next) {
            if (widget.debugLogDiagnostics) {
              developer.log("${widget.routeName}[${widget.key}] page title changed to [$next]", name: debugTag);
            }
            _refreshTitle();
          },
        );
      },
    );
    return Title(
      title: widget.getTitle(ref),
      color: Theme.of(context).colorScheme.primary,
      child: widget.build(context, ref),
    );
  }

  @override
  void dispose() {
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page dispose", name: debugTag);
    }
    widget.onDisposed(context, ref);
    super.dispose();
  }

  void _refreshTitle() {
    setAppSwitcherTitle(context: context, title: widget.getTitle(ref));
  }
}
