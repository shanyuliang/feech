import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../constants.dart';
import '../extensions/general_type_extension.dart';
import '../global.dart';
import '../models/page_lifecycle_state.dart';
import '../models/page_lifecycle_state_signal_container_parameter.dart';
import '../models/page_title_signal_container_parameter.dart';
import '../utilities/handy_util.dart';

abstract class BaseSignalPage extends StatefulWidget {
  final bool debugLogDiagnostics;

  final String? routeName;

  final String initialTitle;

  const BaseSignalPage({super.key, this.routeName, this.initialTitle = '', this.debugLogDiagnostics = false});

  Widget build(BuildContext context);

  @override
  State<StatefulWidget> createState() => _BaseSignalPageState();

  void setTitle(String title) {
    pageTitleSignalContainer(PageTitleSignalContainerParameter(routeName: routeName, initialTitle: initialTitle)).value = title;
  }

  String getTitle() {
    return pageTitleSignalContainer(PageTitleSignalContainerParameter(routeName: routeName, initialTitle: initialTitle)).peek() ?? initialTitle;
  }

  void initialise() {}

  void didChangeDependencies(BuildContext context) {}

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
      developer.log("${widget.routeName}[${widget.key}] page initialise", name: debugTag);
    }
    widget.initialise();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page didChangeDependencies", name: debugTag);
    }
    widget.didChangeDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page build", name: debugTag);
    }
    effect(() {
      switch (appLifecycleStateSignal.value) {
        case AppLifecycleState.resumed:
          if (widget.debugLogDiagnostics) {
            developer.log("${widget.routeName}[${widget.key}] app resumed", name: debugTag);
          }
          widget.onAppResumed(context);
          break;
        case AppLifecycleState.paused:
          if (widget.debugLogDiagnostics) {
            developer.log("${widget.routeName}[${widget.key}] app paused", name: debugTag);
          }
          widget.onAppPaused(context);
          break;
        case AppLifecycleState.detached:
          if (widget.debugLogDiagnostics) {
            developer.log("${widget.routeName}[${widget.key}] app detached", name: debugTag);
          }
          widget.onAppDetached(context);
          break;
        default:
          break;
      }
    });
    widget.routeName?.let((it) {
      effect(() {
        switch (pageLifecycleStateSignalContainer(PageLifecycleStateSignalContainerParameter(routeName: widget.routeName)).value) {
          case PageLifecycleState.resumed:
            if (widget.debugLogDiagnostics) {
              developer.log("${widget.routeName}[${widget.key}] page resumed", name: debugTag);
            }
            _refreshTitle();
            widget.onPageResumed(context);
            break;
          case PageLifecycleState.paused:
            if (widget.debugLogDiagnostics) {
              developer.log("${widget.routeName}[${widget.key}] page paused", name: debugTag);
            }
            widget.onPagePaused(context);
            break;
          default:
            break;
        }
      });
      effect(() {
        final pageTitle =
            pageTitleSignalContainer(PageTitleSignalContainerParameter(routeName: widget.routeName, initialTitle: widget.initialTitle)).value;
        if (widget.debugLogDiagnostics) {
          developer.log("${widget.routeName}[${widget.key}] page title changed to [$pageTitle]", name: debugTag);
        }
        _refreshTitle();
      });
    });
    return Title(title: widget.getTitle(), color: Theme.of(context).colorScheme.primary, child: widget.build(context));
  }

  @override
  void dispose() {
    if (widget.debugLogDiagnostics) {
      developer.log("${widget.routeName}[${widget.key}] page dispose", name: debugTag);
    }
    widget.onDisposed(context);
    super.dispose();
  }

  void _refreshTitle() {
    setAppSwitcherTitle(context: context, title: widget.getTitle());
  }
}
