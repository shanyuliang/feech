import 'package:flutter/material.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

class ModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final bool isDismissible;
  final bool enableDrag;
  final bool showDragHandle;
  final bool useSafeArea;
  final bool isScrollControlled;
  final double scrollControlDisabledMaxHeightRatio;
  final Clip? clipBehavior;

  const ModalBottomSheetPage({
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    required this.builder,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle = true,
    this.useSafeArea = false,
    this.isScrollControlled = false,
    this.scrollControlDisabledMaxHeightRatio = _defaultScrollControlDisabledMaxHeightRatio,
    this.clipBehavior,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        builder: builder,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        showDragHandle: showDragHandle,
        useSafeArea: useSafeArea,
        isScrollControlled: isScrollControlled,
        scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
        clipBehavior: clipBehavior,
      );
}
