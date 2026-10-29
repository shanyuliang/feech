import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:xml/xml.dart';

import 'animated_svg_frame_sequence.dart';

class AnimatedSvgAutoFrameSequence extends StatelessWidget {
  final String svgAssetPath;
  final Duration frameDuration;
  final bool loop;
  final bool autoplay;
  final Pattern frameIdPattern;
  final ValueChanged<int>? onFrameChanged;
  final VoidCallback? onCompleted;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final ColorFilter? colorFilter;
  final WidgetBuilder? placeholderBuilder;
  final WidgetBuilder? loadingBuilder;
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  const AnimatedSvgAutoFrameSequence({
    super.key,
    required this.svgAssetPath,
    this.frameDuration = const Duration(milliseconds: 100),
    this.loop = true,
    this.autoplay = true,
    this.frameIdPattern = r'^frame[-_ ]?\d+$',
    this.onFrameChanged,
    this.onCompleted,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.colorFilter,
    this.placeholderBuilder,
    this.loadingBuilder,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _extractFrameSvgsFromAsset(svgAssetPath: svgAssetPath, frameIdPattern: frameIdPattern),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorBuilder?.call(context, snapshot.error!) ?? const SizedBox.shrink();
        }
        final frameSvgs = snapshot.data;
        if (frameSvgs == null) {
          return loadingBuilder?.call(context) ?? SizedBox(width: width, height: height);
        }
        if (frameSvgs.isEmpty) {
          return const SizedBox.shrink();
        }
        return AnimatedSvgFrameSequence(
          frameCount: frameSvgs.length,
          frameDuration: frameDuration,
          loop: loop,
          autoplay: autoplay,
          onFrameChanged: onFrameChanged,
          onCompleted: onCompleted,
          frameBuilder: (context, frameIndex) {
            return SvgPicture.string(
              frameSvgs[frameIndex],
              width: width,
              height: height,
              fit: fit,
              alignment: alignment,
              colorFilter: colorFilter,
              placeholderBuilder: placeholderBuilder,
            );
          },
        );
      },
    );
  }

  Future<List<String>> _extractFrameSvgsFromAsset({required String svgAssetPath, required Pattern frameIdPattern}) async {
    final svgContent = await rootBundle.loadString(svgAssetPath);
    return _extractFrameSvgs(svgContent: svgContent, frameIdPattern: frameIdPattern);
  }

  List<String> _extractFrameSvgs({required String svgContent, required Pattern frameIdPattern}) {
    final document = XmlDocument.parse(svgContent);
    final svgElements = document.findAllElements('svg');
    if (svgElements.isEmpty) {
      return const [];
    }
    final svgRoot = svgElements.first;
    final frameIds = <String>[];
    for (final element in svgRoot.descendants.whereType<XmlElement>()) {
      if (element.name.local == 'g') {
        final id = element.getAttribute('id');
        if (id != null && _matchesPattern(id, frameIdPattern)) {
          frameIds.add(id);
        }
      }
    }
    if (frameIds.isEmpty) {
      return const [];
    }
    frameIds.sort(_frameOrderComparator);
    return frameIds.map((selectedFrameId) {
      final clonedRoot = _cloneKeepingOnlySelectedFrame(svgRoot, frameIdPattern: frameIdPattern, selectedFrameId: selectedFrameId);
      return clonedRoot.toXmlString(pretty: false);
    }).toList(growable: false);
  }

  XmlElement _cloneKeepingOnlySelectedFrame(
    XmlElement root, {
    required Pattern frameIdPattern,
    required String selectedFrameId,
  }) {
    XmlNode? cloneNode(XmlNode node) {
      if (node is XmlElement) {
        final id = node.getAttribute('id');
        if (node.name.local == 'g' &&
            id != null &&
            _matchesPattern(id, frameIdPattern) &&
            id != selectedFrameId) {
          return null;
        }
        final clonedChildren = <XmlNode>[];
        for (final child in node.children) {
          final clonedChild = cloneNode(child);
          if (clonedChild != null) {
            clonedChildren.add(clonedChild);
          }
        }
        return XmlElement(
          node.name,
          node.attributes.map((attribute) {
            return XmlAttribute(attribute.name, attribute.value);
          }),
          clonedChildren,
        );
      }
      if (node is XmlText) {
        return XmlText(node.value);
      }
      if (node is XmlCDATA) {
        return XmlCDATA(node.value);
      }
      if (node is XmlComment) {
        return XmlComment(node.value);
      }
      if (node is XmlProcessing) {
        return XmlProcessing(node.target, node.value);
      }
      return null;
    }

    return cloneNode(root) as XmlElement;
  }

  bool _matchesPattern(String value, Pattern pattern) {
    if (pattern is RegExp) {
      return pattern.hasMatch(value);
    }
    return value.contains(pattern);
  }

  int _frameOrderComparator(String left, String right) {
    final leftNumber = _extractTrailingNumber(left);
    final rightNumber = _extractTrailingNumber(right);
    if (leftNumber == null && rightNumber == null) {
      return left.compareTo(right);
    }
    if (leftNumber == null) {
      return 1;
    }
    if (rightNumber == null) {
      return -1;
    }
    return leftNumber.compareTo(rightNumber);
  }

  int? _extractTrailingNumber(String value) {
    final match = RegExp(r'(\d+)$').firstMatch(value);
    return match == null ? null : int.tryParse(match.group(1)!);
  }
}
