// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum DisplayWidthMode {
  // Phone in portrait
  compact(
    0.0,
  ),
  // Tablet in portrait
  // Foldable in portrait (unfolded)
  medium(
    600.0,
  ),
  // Phone in landscape
  // Tablet in landscape
  // Foldable in landscape (unfolded)
  // Desktop
  expanded(
    840.0,
  ),
  // Desktop
  large(
    1200.0,
  ),
  // Desktop
  // Ultra-wide
  extraLarge(
    1600.0,
  );

  const DisplayWidthMode(
    this.minWidth,
  );

  final double minWidth;
}
