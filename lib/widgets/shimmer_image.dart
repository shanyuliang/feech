import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'shimmer.dart';

// If both provided, imageAsset has higher priority than iconData
// If both not provided, use Icons.image_outlined
class ShimmerImage extends StatelessWidget {
  final String? imageAsset;
  final IconData iconData;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerImage({
    super.key,
    this.imageAsset,
    this.iconData = Icons.image_outlined,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) => Shimmer(
        baseColor: baseColor,
        highlightColor: highlightColor,
        blendMode: BlendMode.srcATop,
        child: imageAsset != null
            ? (imageAsset!.endsWith('.svg')
                ? SvgPicture.asset(imageAsset!, fit: BoxFit.contain)
                : Image.asset(imageAsset!, fit: BoxFit.contain))
            : FittedBox(fit: BoxFit.fill, child: Icon(iconData)),
      );
}
