import 'package:flutter/material.dart';

class RoundCornerAvatar extends StatelessWidget {
  const RoundCornerAvatar({
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.size,
    this.minSize,
    this.maxSize,
    this.radius,
  }) : assert(size == null || (minSize == null && maxSize == null)),
       assert(backgroundImage != null || onBackgroundImageError == null),
       assert(foregroundImage != null || onForegroundImageError == null);
  final Widget? child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final ImageProvider? backgroundImage;
  final ImageProvider? foregroundImage;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final Size? size;
  final Size? minSize;
  final Size? maxSize;
  final double? radius;
  static const Size _defaultSize = Size(40.0, 40.0);
  static const Size _defaultMinSize = Size.zero;
  static const Size _defaultMaxSize = Size.infinite;
  static const double _defaultRadius = 8.0;

  Size get _minSize {
    if (size == null && minSize == null && maxSize == null) {
      return _defaultSize;
    }
    return size ?? minSize ?? _defaultMinSize;
  }

  Size get _maxSize {
    if (size == null && minSize == null && maxSize == null) {
      return _defaultSize;
    }
    return size ?? maxSize ?? _defaultMaxSize;
  }

  double get _radius {
    return radius ?? _defaultRadius;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    final Color? effectiveForegroundColor = foregroundColor ?? (theme.useMaterial3 ? theme.colorScheme.onPrimaryContainer : null);
    final TextStyle effectiveTextStyle = theme.useMaterial3 ? theme.textTheme.titleMedium! : theme.primaryTextTheme.titleMedium!;
    TextStyle textStyle = effectiveTextStyle.copyWith(color: effectiveForegroundColor);
    Color? effectiveBackgroundColor = backgroundColor ?? (theme.useMaterial3 ? theme.colorScheme.primaryContainer : null);
    if (effectiveBackgroundColor == null) {
      effectiveBackgroundColor = switch (ThemeData.estimateBrightnessForColor(textStyle.color!)) {
        Brightness.dark => theme.primaryColorLight,
        Brightness.light => theme.primaryColorDark,
      };
    } else if (effectiveForegroundColor == null) {
      textStyle = switch (ThemeData.estimateBrightnessForColor(backgroundColor!)) {
        Brightness.dark => textStyle.copyWith(color: theme.primaryColorLight),
        Brightness.light => textStyle.copyWith(color: theme.primaryColorDark),
      };
    }
    final minSize = _minSize;
    final maxSize = _maxSize;
    return AnimatedContainer(
      constraints: BoxConstraints(minHeight: minSize.height, minWidth: minSize.width, maxWidth: maxSize.width, maxHeight: maxSize.height),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        image: backgroundImage != null ? DecorationImage(image: backgroundImage!, onError: onBackgroundImageError, fit: BoxFit.cover) : null,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(_radius),
      ),
      foregroundDecoration:
          foregroundImage != null
              ? BoxDecoration(
                image: DecorationImage(image: foregroundImage!, onError: onForegroundImageError, fit: BoxFit.cover),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(_radius),
              )
              : null,
      child:
          child == null
              ? null
              : Center(
                // Need to disable text scaling here so that the text doesn't
                // escape the avatar when the textScaleFactor is large.
                child: MediaQuery.withNoTextScaling(
                  child: IconTheme(data: theme.iconTheme.copyWith(color: textStyle.color), child: DefaultTextStyle(style: textStyle, child: child!)),
                ),
              ),
    );
  }
}
