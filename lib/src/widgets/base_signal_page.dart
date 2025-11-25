import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../models/page_lifecycle_state.dart';
import '../models/page_parameter.dart';
import '../signals/app_lifecycle_state_signal/app_lifecycle_state_signal.dart';
import '../signals/page_lifecycle_state_signal_container.dart';
import '../signals/page_title_signal_container.dart';
import '../utilities/handy_util.dart';

abstract class BaseSignalPage extends StatefulWidget {
  final bool debugLogDiagnostics;
  final PageParameter pageParameter;

  final AppLifecycleStateSignal? appLifecycleStateSignal;
  final PageLifecycleStateSignalContainer? pageLifecycleStateSignalContainer;
  final PageTitleSignalContainer? pageTitleSignalContainer;

  const BaseSignalPage({
    super.key,
    required this.pageParameter,
    this.appLifecycleStateSignal,
    this.pageLifecycleStateSignalContainer,
    this.pageTitleSignalContainer,
    this.debugLogDiagnostics = false,
  });

  @override
  State<StatefulWidget> createState() => _BaseSignalPageState();

  void setTitle(String title) {
    pageTitleSignalContainer?.let((it) {
      final pageTitleSignal = it(pageParameter);
      pageTitleSignal.value = title;
    });
  }

  String? getTitle() {
    return pageTitleSignalContainer?.let((it) {
      final pageTitleSignal = it(pageParameter);
      return pageTitleSignal.peek();
    });
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
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page initialise", name: debugTag);
    }
    widget.initialise();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page didChangeDependencies", name: debugTag);
    }
    if (widget.appLifecycleStateSignal != null) {
      effect(() {
        final appLifecycleState = widget.appLifecycleStateSignal!.value;
        switch (appLifecycleState) {
          case AppLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app resumed", name: debugTag);
            }
            widget.onAppResumed(context);
            break;
          case AppLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app paused", name: debugTag);
            }
            widget.onAppPaused(context);
            break;
          case AppLifecycleState.detached:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app detached", name: debugTag);
            }
            widget.onAppDetached(context);
            break;
          default:
            if (widget.debugLogDiagnostics) {
              developer.log(
                "[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] app lifecycle status: ${appLifecycleState.name}",
                name: debugTag,
              );
            }
            break;
        }
      });
    }
    effect(() {
      widget.pageLifecycleStateSignalContainer?.let((it) {
        final pageLifecycleStateSignal = it(widget.pageParameter);
        final pageLifecycleState = pageLifecycleStateSignal.value;
        switch (pageLifecycleState) {
          case PageLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page resumed", name: debugTag);
            }
            widget.refreshTitle(context);
            widget.onPageResumed(context);
            break;
          case PageLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page paused", name: debugTag);
            }
            widget.onPagePaused(context);
            break;
          default:
            if (widget.debugLogDiagnostics) {
              developer.log(
                "[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page lifecycle status:${pageLifecycleState.name}",
                name: debugTag,
              );
            }
            break;
        }
      });
    });
    effect(() {
      widget.pageTitleSignalContainer?.let((it) {
        final pageTitleSignal = it(widget.pageParameter);
        final pageTitle = pageTitleSignal.value;
        if (widget.debugLogDiagnostics) {
          developer.log(
            "[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page title changed to [$pageTitle]",
            name: debugTag,
          );
        }
        widget.refreshTitle(context);
      });
    });
    widget.didChangeDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page build", name: debugTag);
    }
    return Title(title: widget.getTitle() ?? '', color: Theme.of(context).colorScheme.primary, child: widget.build(context));
  }

  @override
  void dispose() {
    if (widget.debugLogDiagnostics) {
      developer.log("[${widget.pageParameter.routeName}][${widget.key}][${widget.hashCode}-$hashCode] page dispose", name: debugTag);
    }
    widget.onDisposed(context);
    super.dispose();
  }
}
