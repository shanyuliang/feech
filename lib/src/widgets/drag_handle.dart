import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({
    super.key,
    this.onSemanticsTap,
    this.handleHover,
    this.widgetState,
    this.dragHandleColor,
    this.dragHandleSize,
    this.topPadding,
    this.bottomPadding,
    this.onPressed,
  });

  final VoidCallback? onSemanticsTap;
  final ValueChanged<bool>? handleHover;
  final Set<WidgetState>? widgetState;
  final Color? dragHandleColor;
  final Size? dragHandleSize;
  final double? topPadding;
  final double? bottomPadding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bottomSheetTheme = Theme.of(context).bottomSheetTheme;
    final m3Defaults = _BottomSheetDefaultsM3(context);
    final handleSize = dragHandleSize ?? bottomSheetTheme.dragHandleSize ?? m3Defaults.dragHandleSize!;
    final realTopPadding = topPadding ?? (kMinInteractiveDimension - handleSize.height) / 2;
    final realBottomPadding = bottomPadding ?? (kMinInteractiveDimension - handleSize.height) / 2;

    return MouseRegion(
      onEnter: (PointerEnterEvent event) => handleHover?.call(true),
      onExit: (PointerExitEvent event) => handleHover?.call(false),
      child: Semantics(
        label: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        container: true,
        onTap: onSemanticsTap,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.only(top: realTopPadding, bottom: realBottomPadding),
            child: Center(
              child: Container(
                height: handleSize.height,
                width: handleSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(handleSize.height / 2),
                  color: WidgetStateProperty.resolveAs<Color?>(dragHandleColor, widgetState ?? {}) ??
                      WidgetStateProperty.resolveAs<Color?>(bottomSheetTheme.dragHandleColor, widgetState ?? {}) ??
                      m3Defaults.dragHandleColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheetDefaultsM3 extends BottomSheetThemeData {
  _BottomSheetDefaultsM3(this.context)
      : super(
          elevation: 1.0,
          modalElevation: 1.0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28.0))),
          constraints: const BoxConstraints(maxWidth: 640),
        );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  Color? get backgroundColor => _colors.surfaceContainerLow;

  @override
  Color? get surfaceTintColor => Colors.transparent;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get dragHandleColor => _colors.onSurfaceVariant;

  @override
  Size? get dragHandleSize => const Size(32, 4);

  @override
  BoxConstraints? get constraints => const BoxConstraints(maxWidth: 640.0);
}
