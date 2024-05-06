enum ScreenWidthMode {
  small(
    minWidth: 0,
  ),
  medium(
    minWidth: mediumScreenWidth,
  ),
  large(
    minWidth: largeScreenWidth,
  );

  const ScreenWidthMode({
    required this.minWidth,
  });

  final int minWidth;

  static const mediumScreenWidth = 576;
  static const largeScreenWidth = 896;
}
