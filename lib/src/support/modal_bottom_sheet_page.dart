import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final bool isDismissible;
  final bool enableDrag;
  final bool showDragHandle;
  final bool useSafeArea;
  final bool isScrollControlled;

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
      );
}
