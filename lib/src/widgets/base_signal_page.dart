import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../global.dart';
import '../models/page_lifecycle_state.dart';
import '../signals/app_lifecycle_state_signal/app_lifecycle_state_signal.dart';
import '../signals/page_title_map_signal.dart';
import '../utilities/handy_util.dart';

abstract class BaseSignalPage extends StatefulWidget {
  final bool debugLogDiagnostics;

  final String? routeName;

  final String initialTitle;

  final AppLifecycleStateSignal? appLifecycleStateSignal;

  final PageTitleMapSignal? pageTitleMapSignal;

  late final pageLifecycleStateSignal = pageLifecycleStateSignalMap.select((s) => s.value[routeName] ?? PageLifecycleState.detached);

  // late final pageTitleSignal = pageTitleSignalMap.select((s) => s.value[routeName] ?? initialTitle);

  BaseSignalPage({
    super.key,
    this.routeName,
    this.initialTitle = '',
    this.appLifecycleStateSignal,
    this.pageTitleMapSignal,
    this.debugLogDiagnostics = false,
  });

  @override
  State<StatefulWidget> createState() => _BaseSignalPageState();

  void setTitle(String title) {
    pageTitleMapSignal?[routeName] = title;
  }

  String getTitle() {
    return pageTitleMapSignal?[routeName] ?? initialTitle;
  }

  void refreshTitle(BuildContext context) {
    setAppSwitcherTitle(context: context, title: getTitle());
  }

  void initialise() {}

  void didChangeDependencies(BuildContext context) {}

  Widget build(BuildContext context);

  void onDisposed(BuildContext context) {}

  void onAppResumed(BuildContext context) {}

  void onAppPaused(BuildContext context) {}

  void onAppDetached(BuildContext context) {}

  void onPageResumed(BuildContext context) {}

  void onPagePaused(BuildContext context) {}
}

class _BaseSignalPageState extends State<BaseSignalPage> {
  @override
  void initState() {
    super.initState();
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page initialise", name: debugTag);
    }
    if (widget.appLifecycleStateSignal != null) {
      effect(() {
        final appLifecycleState = widget.appLifecycleStateSignal!.value;
        switch (appLifecycleState) {
          case AppLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app resumed", name: debugTag);
            }
            widget.onAppResumed(context);
            break;
          case AppLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app paused", name: debugTag);
            }
            widget.onAppPaused(context);
            break;
          case AppLifecycleState.detached:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app detached", name: debugTag);
            }
            widget.onAppDetached(context);
            break;
          default:
            if (widget.debugLogDiagnostics) {
              developer.log(
                "[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app lifecycle status: ${appLifecycleState.name}",
                name: debugTag,
              );
            }
            break;
        }
      });
    }
    widget.routeName?.let((it) {
      effect(() {
        final pageLifecycleState = widget.pageLifecycleStateSignal.value;
        switch (pageLifecycleState) {
          case PageLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page resumed", name: debugTag);
            }
            widget.refreshTitle(context);
            widget.onPageResumed(context);
            break;
          case PageLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page paused", name: debugTag);
            }
            widget.onPagePaused(context);
            break;
          default:
            if (widget.debugLogDiagnostics) {
              developer.log(
                "[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page lifecycle status:${pageLifecycleState.name}",
                name: debugTag,
              );
            }
            break;
        }
      });
      effect(() {
        final pageTitle = widget.pageTitleMapSignal?[widget.routeName];
        if (widget.debugLogDiagnostics) {
          developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page title changed to [$pageTitle]", name: debugTag);
        }
        widget.refreshTitle(context);
      });
    });
    widget.initialise();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page didChangeDependencies", name: debugTag);
    }
    widget.didChangeDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page build", name: debugTag);
    }
    return Title(title: widget.getTitle(), color: Theme.of(context).colorScheme.primary, child: widget.build(context));
  }

  @override
  void dispose() {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page dispose", name: debugTag);
    }
    widget.onDisposed(context);
    super.dispose();
  }
}
