import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:xml/xml.dart';

class SmilCssSvgMvpWidget extends StatefulWidget {
  final String _svgSource;
  final _SmilSvgSourceType _sourceType;
  final Map<String, String>? headers;
  final bool loop;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final WidgetBuilder? loadingBuilder;
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  const SmilCssSvgMvpWidget.asset({
    super.key,
    required String assetPath,
    this.loop = true,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _svgSource = assetPath,
       _sourceType = _SmilSvgSourceType.asset,
       headers = null;

  const SmilCssSvgMvpWidget.network({
    super.key,
    required String url,
    this.headers,
    this.loop = true,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _svgSource = url,
       _sourceType = _SmilSvgSourceType.network;

  const SmilCssSvgMvpWidget.string({
    super.key,
    required String svgXml,
    this.loop = true,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _svgSource = svgXml,
       _sourceType = _SmilSvgSourceType.inline,
       headers = null;

  @override
  State<SmilCssSvgMvpWidget> createState() => _SmilCssSvgMvpWidgetState();
}

class _SmilCssSvgMvpWidgetState extends State<SmilCssSvgMvpWidget> with SingleTickerProviderStateMixin {
  _SmilSvgMvpEngine? _engine;
  AnimationController? _controller;
  String? _currentSvg;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    try {
      final rawSvg = await _loadSvg();
      final engine = _SmilSvgMvpEngine(svgXml: rawSvg);
      if (mounted) {
        _engine = engine;
        final duration = engine.timelineDuration;
        _controller = AnimationController(vsync: this, duration: duration)
          ..addListener(() {
            final active = _engine;
            if (active == null) {
              return;
            }
            final timeMs = _controller!.value * active.timelineDuration.inMilliseconds;
            setState(() {
              _currentSvg = active.renderAt(Duration(milliseconds: timeMs.round()));
            });
          });
        if (widget.loop) {
          _controller!.repeat();
        } else {
          _controller!.forward(from: 0);
        }
        setState(() {
          _currentSvg = engine.renderAt(Duration.zero);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e;
        });
      }
    }
  }

  Future<String> _loadSvg() async {
    switch (widget._sourceType) {
      case _SmilSvgSourceType.asset:
        return rootBundle.loadString(widget._svgSource);
      case _SmilSvgSourceType.network:
        final response = await http.get(Uri.parse(widget._svgSource), headers: widget.headers);
        if (response.statusCode < 200 || response.statusCode > 299) {
          throw FlutterError('Failed to fetch SVG: HTTP ${response.statusCode} for ${widget._svgSource}');
        }
        return response.body;
      case _SmilSvgSourceType.inline:
        return widget._svgSource;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return widget.errorBuilder?.call(context, _error!) ?? const SizedBox.shrink();
    }
    if (_currentSvg == null) {
      return widget.loadingBuilder?.call(context) ?? SizedBox(width: widget.width, height: widget.height);
    }
    return SvgPicture.string(
      _currentSvg!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      alignment: widget.alignment,
    );
  }
}

class _SmilSvgMvpEngine {
  final XmlDocument _document;
  final List<_SmilAnim> _animations;
  final List<_CssAnimBinding> _cssAnimations;
  final Duration timelineDuration;

  _SmilSvgMvpEngine._(this._document, this._animations, this._cssAnimations, this.timelineDuration);

  factory _SmilSvgMvpEngine({required String svgXml}) {
    final document = XmlDocument.parse(svgXml);
    final animations = _parseSmilAnimations(document);
    final cssAnimations = _parseCssAnimations(document);
    final duration = _computeDuration(animations, cssAnimations);
    return _SmilSvgMvpEngine._(document, animations, cssAnimations, duration);
  }

  static Duration _computeDuration(List<_SmilAnim> animations, List<_CssAnimBinding> cssAnimations) {
    if (animations.isEmpty && cssAnimations.isEmpty) {
      return const Duration(milliseconds: 500);
    }
    final smilMaxMs = animations
        .map((a) => a.begin.inMilliseconds + a.dur.inMilliseconds)
        .fold<int>(1, (acc, e) => math.max(acc, e));
    final cssMaxMs = cssAnimations
        .map((a) => a.duration.inMilliseconds)
        .fold<int>(1, (acc, e) => math.max(acc, e));
    return Duration(milliseconds: math.max(smilMaxMs, cssMaxMs));
  }

  static List<_SmilAnim> _parseSmilAnimations(XmlDocument document) {
    final all = <_SmilAnim>[];
    for (final element in document.descendants.whereType<XmlElement>()) {
      final targetId = element.getAttribute('id');
      if (targetId == null) {
        continue;
      }
      for (final child in element.children.whereType<XmlElement>()) {
        switch (child.name.local) {
          case 'animate':
            {
              final attributeName = child.getAttribute('attributeName');
              if (attributeName == null) {
                continue;
              }
              final begin = _parseClock(child.getAttribute('begin') ?? '0s');
              final dur = _parseClock(child.getAttribute('dur') ?? '0s');
              if (dur.inMilliseconds <= 0) {
                continue;
              }
              final from = child.getAttribute('from') ?? element.getAttribute(attributeName) ?? '0';
              final to = child.getAttribute('to');
              final values = child.getAttribute('values');
              all.add(
                _SmilAnimate(
                  targetId: targetId,
                  attributeName: attributeName,
                  begin: begin,
                  dur: dur,
                  from: from,
                  to: to,
                  values: values,
                  fillFreeze: (child.getAttribute('fill') ?? '') == 'freeze',
                ),
              );
              break;
            }
          case 'animateTransform':
            {
              final transformType = child.getAttribute('type');
              if (transformType == null) {
                continue;
              }
              final begin = _parseClock(child.getAttribute('begin') ?? '0s');
              final dur = _parseClock(child.getAttribute('dur') ?? '0s');
              if (dur.inMilliseconds <= 0) {
                continue;
              }
              final from = child.getAttribute('from') ?? '';
              final to = child.getAttribute('to') ?? '';
              all.add(
                _SmilAnimateTransform(
                  targetId: targetId,
                  begin: begin,
                  dur: dur,
                  transformType: transformType,
                  from: from,
                  to: to,
                  fillFreeze: (child.getAttribute('fill') ?? '') == 'freeze',
                ),
              );
              break;
            }
          case 'set':
            {
              final attributeName = child.getAttribute('attributeName');
              final to = child.getAttribute('to');
              if (attributeName == null || to == null) {
                continue;
              }
              final begin = _parseClock(child.getAttribute('begin') ?? '0s');
              final dur = _parseClock(child.getAttribute('dur') ?? '0s');
              all.add(
                _SmilSet(
                  targetId: targetId,
                  attributeName: attributeName,
                  to: to,
                  begin: begin,
                  dur: dur,
                  fillFreeze: (child.getAttribute('fill') ?? '') == 'freeze',
                ),
              );
            }
        }
      }
    }
    return all;
  }

  static List<_CssAnimBinding> _parseCssAnimations(XmlDocument document) {
    final styleText = document
        .findAllElements('style')
        .map((style) => style.innerText)
        .join('\n');
    if (styleText.trim().isEmpty) {
      return const [];
    }
    final keyframesByName = _parseCssKeyframes(styleText);
    final bindings = <_CssAnimBinding>[];
    final bindingRegExp = RegExp(
      r'#([A-Za-z0-9\-_]+)\s*\{\s*animation:\s*([A-Za-z0-9\-_]+)\s+([0-9.]+)(ms|s)\s+[^;}]*?(infinite)?[^;}]*\}',
      multiLine: true,
    );
    for (final match in bindingRegExp.allMatches(styleText)) {
      final id = match.group(1);
      final animationName = match.group(2);
      final durationNum = double.tryParse(match.group(3) ?? '');
      final durationUnit = match.group(4);
      final infinite = (match.group(5) ?? '').contains('infinite');
      if (id == null || animationName == null || durationNum == null || durationUnit == null) {
        continue;
      }
      final keyframes = keyframesByName[animationName];
      if (keyframes == null || keyframes.frames.isEmpty) {
        continue;
      }
      final durationMs = durationUnit == 's' ? (durationNum * 1000).round() : durationNum.round();
      bindings.add(
        _CssAnimBinding(
          targetId: id,
          animationName: animationName,
          duration: Duration(milliseconds: math.max(1, durationMs)),
          infinite: infinite,
          keyframes: keyframes,
        ),
      );
    }
    return bindings;
  }

  static Map<String, _CssKeyframes> _parseCssKeyframes(String css) {
    final result = <String, _CssKeyframes>{};
    final keyframesRegExp = RegExp(r'@keyframes\s+([A-Za-z0-9\-_]+)\s*\{', multiLine: true);
    for (final match in keyframesRegExp.allMatches(css)) {
      final name = match.group(1);
      if (name == null) {
        continue;
      }
      final openIndex = match.end - 1;
      final closeIndex = _findMatchingBrace(css, openIndex);
      if (closeIndex < 0) {
        continue;
      }
      final body = css.substring(openIndex + 1, closeIndex);
      final frameRegExp = RegExp(r'([0-9.]+)%\s*\{([^}]*)\}', multiLine: true);
      final frames = <_CssFrame>[];
      for (final frameMatch in frameRegExp.allMatches(body)) {
        final percent = double.tryParse(frameMatch.group(1) ?? '');
        final propsBlock = frameMatch.group(2);
        if (percent == null || propsBlock == null) {
          continue;
        }
        frames.add(_CssFrame(percent: percent, properties: _parseCssProperties(propsBlock)));
      }
      frames.sort((a, b) => a.percent.compareTo(b.percent));
      result[name] = _CssKeyframes(name: name, frames: frames);
    }
    return result;
  }

  static int _findMatchingBrace(String text, int openBraceIndex) {
    var depth = 0;
    for (var i = openBraceIndex; i < text.length; i += 1) {
      final ch = text[i];
      if (ch == '{') {
        depth += 1;
      } else if (ch == '}') {
        depth -= 1;
        if (depth == 0) {
          return i;
        }
      }
    }
    return -1;
  }

  static Map<String, String> _parseCssProperties(String block) {
    final result = <String, String>{};
    for (final part in block.split(';')) {
      final pieces = part.split(':');
      if (pieces.length < 2) {
        continue;
      }
      final key = pieces.first.trim();
      final value = pieces.sublist(1).join(':').trim();
      if (key.isNotEmpty && value.isNotEmpty) {
        result[key] = value;
      }
    }
    return result;
  }

  String renderAt(Duration t) {
    final cloned = XmlDocument.parse(_document.toXmlString(pretty: false));
    final map = <String, XmlElement>{};
    for (final element in cloned.descendants.whereType<XmlElement>()) {
      final id = element.getAttribute('id');
      if (id != null) {
        map[id] = element;
      }
    }
    for (final animation in _animations) {
      final target = map[animation.targetId];
      if (target == null) {
        continue;
      }
      animation.apply(target, t);
    }
    for (final cssAnimation in _cssAnimations) {
      final target = map[cssAnimation.targetId];
      if (target == null) {
        continue;
      }
      cssAnimation.apply(target, t, timelineDuration);
    }
    for (final styleNode in cloned.findAllElements('style').toList(growable: false)) {
      styleNode.parent?.children.remove(styleNode);
    }
    return cloned.toXmlString(pretty: false);
  }
}

Duration _parseClock(String value) {
  final trimmed = value.trim();
  if (trimmed.endsWith('ms')) {
    return Duration(milliseconds: int.tryParse(trimmed.substring(0, trimmed.length - 2)) ?? 0);
  }
  if (trimmed.endsWith('s')) {
    final seconds = double.tryParse(trimmed.substring(0, trimmed.length - 1)) ?? 0;
    return Duration(milliseconds: (seconds * 1000).round());
  }
  final plain = double.tryParse(trimmed) ?? 0;
  return Duration(milliseconds: (plain * 1000).round());
}

abstract class _SmilAnim {
  final String targetId;
  final Duration begin;
  final Duration dur;
  final bool fillFreeze;

  _SmilAnim({required this.targetId, required this.begin, required this.dur, required this.fillFreeze});

  void apply(XmlElement target, Duration t);

  double? progress(Duration t) {
    if (t < begin) {
      return null;
    }
    if (dur.inMilliseconds <= 0) {
      return null;
    }
    final elapsed = t - begin;
    if (elapsed > dur) {
      return fillFreeze ? 1 : null;
    }
    return (elapsed.inMilliseconds / dur.inMilliseconds).clamp(0, 1);
  }
}

class _SmilAnimate extends _SmilAnim {
  final String attributeName;
  final String from;
  final String? to;
  final String? values;

  _SmilAnimate({
    required super.targetId,
    required super.begin,
    required super.dur,
    required super.fillFreeze,
    required this.attributeName,
    required this.from,
    required this.to,
    required this.values,
  });

  @override
  void apply(XmlElement target, Duration t) {
    final p = progress(t);
    if (p == null) {
      return;
    }
    if (values != null && values!.contains(';')) {
      final keyValues = values!.split(';').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(growable: false);
      if (keyValues.isNotEmpty) {
        final position = (p * (keyValues.length - 1)).clamp(0, keyValues.length - 1);
        final left = position.floor();
        final right = math.min(keyValues.length - 1, left + 1);
        final localP = position - left;
        final leftNum = double.tryParse(keyValues[left]);
        final rightNum = double.tryParse(keyValues[right]);
        if (leftNum != null && rightNum != null) {
          final v = leftNum + (rightNum - leftNum) * localP;
          target.setAttribute(attributeName, _formatNumber(v));
        } else {
          target.setAttribute(attributeName, keyValues[left]);
        }
      }
      return;
    }
    final fromNum = double.tryParse(from);
    final toNum = to == null ? null : double.tryParse(to!);
    if (fromNum != null && toNum != null) {
      final value = fromNum + (toNum - fromNum) * p;
      target.setAttribute(attributeName, _formatNumber(value));
      return;
    }
    if (to != null) {
      target.setAttribute(attributeName, p < 1 ? from : to!);
    }
  }
}

class _SmilSet extends _SmilAnim {
  final String attributeName;
  final String to;

  _SmilSet({
    required super.targetId,
    required super.begin,
    required super.dur,
    required super.fillFreeze,
    required this.attributeName,
    required this.to,
  });

  @override
  void apply(XmlElement target, Duration t) {
    final p = progress(t);
    if (p == null) {
      return;
    }
    target.setAttribute(attributeName, to);
  }
}

class _SmilAnimateTransform extends _SmilAnim {
  final String transformType;
  final String from;
  final String to;

  _SmilAnimateTransform({
    required super.targetId,
    required super.begin,
    required super.dur,
    required super.fillFreeze,
    required this.transformType,
    required this.from,
    required this.to,
  });

  @override
  void apply(XmlElement target, Duration t) {
    final p = progress(t);
    if (p == null) {
      return;
    }
    final fromValues = _parseNumList(from);
    final toValues = _parseNumList(to);
    if (fromValues.isEmpty || toValues.isEmpty) {
      return;
    }
    final maxLen = math.min(fromValues.length, toValues.length);
    final current = <double>[];
    for (var i = 0; i < maxLen; i += 1) {
      current.add(fromValues[i] + (toValues[i] - fromValues[i]) * p);
    }
    target.setAttribute('transform', '$transformType(${current.map(_formatNumber).join(' ')})');
  }
}

List<double> _parseNumList(String value) {
  return value
      .split(RegExp(r'[,\s]+'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .map((e) => double.tryParse(e))
      .whereType<double>()
      .toList(growable: false);
}

String _formatNumber(double value) {
  if (value % 1 == 0) {
    return value.toInt().toString();
  }
  return value.toStringAsFixed(4).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
}

enum _SmilSvgSourceType { asset, network, inline }

class _CssAnimBinding {
  final String targetId;
  final String animationName;
  final Duration duration;
  final bool infinite;
  final _CssKeyframes keyframes;

  _CssAnimBinding({
    required this.targetId,
    required this.animationName,
    required this.duration,
    required this.infinite,
    required this.keyframes,
  });

  void apply(XmlElement target, Duration t, Duration timelineDuration) {
    if (keyframes.frames.isEmpty) {
      return;
    }
    final durationMs = math.max(1, duration.inMilliseconds);
    final timelineMs = t.inMilliseconds;
    final activeMs = infinite ? (timelineMs % durationMs) : math.min(timelineMs, durationMs);
    final progressPercent = (activeMs / durationMs) * 100;
    final current = _frameAt(progressPercent);
    if (current == null) {
      return;
    }
    _applyCssProperties(target, current.properties);
  }

  _CssFrame? _frameAt(double percent) {
    if (keyframes.frames.isEmpty) {
      return null;
    }
    if (percent <= keyframes.frames.first.percent) {
      return keyframes.frames.first;
    }
    if (percent >= keyframes.frames.last.percent) {
      return keyframes.frames.last;
    }
    for (var i = 0; i < keyframes.frames.length - 1; i += 1) {
      final left = keyframes.frames[i];
      final right = keyframes.frames[i + 1];
      if (percent >= left.percent && percent <= right.percent) {
        final ratio = ((percent - left.percent) / (right.percent - left.percent)).clamp(0, 1).toDouble();
        return _CssFrame(
          percent: percent,
          properties: _interpolateCssProperties(left.properties, right.properties, ratio),
        );
      }
    }
    return keyframes.frames.last;
  }

  Map<String, String> _interpolateCssProperties(Map<String, String> left, Map<String, String> right, double ratio) {
    final allKeys = {...left.keys, ...right.keys};
    final out = <String, String>{};
    for (final key in allKeys) {
      final lv = left[key];
      final rv = right[key];
      if (lv == null && rv != null) {
        out[key] = rv;
        continue;
      }
      if (rv == null && lv != null) {
        out[key] = lv;
        continue;
      }
      if (lv == null || rv == null) {
        continue;
      }
      if (key == 'opacity') {
        final lNum = double.tryParse(lv);
        final rNum = double.tryParse(rv);
        if (lNum != null && rNum != null) {
          out[key] = _formatNumber(lNum + (rNum - lNum) * ratio);
          continue;
        }
      }
      if (key == 'transform') {
        out[key] = _interpolateTransform(lv, rv, ratio);
        continue;
      }
      if (key == 'd') {
        out[key] = ratio < 0.5 ? lv : rv;
        continue;
      }
      out[key] = ratio < 0.5 ? lv : rv;
    }
    return out;
  }

  String _interpolateTransform(String left, String right, double ratio) {
    final lParsed = _parseTransform(left);
    final rParsed = _parseTransform(right);
    if (lParsed == null || rParsed == null) {
      return ratio < 0.5 ? left : right;
    }
    final lTranslate = lParsed.$1;
    final rTranslate = rParsed.$1;
    final lRotate = lParsed.$2;
    final rRotate = rParsed.$2;
    final tx = lTranslate.dx + (rTranslate.dx - lTranslate.dx) * ratio;
    final ty = lTranslate.dy + (rTranslate.dy - lTranslate.dy) * ratio;
    final rot = lRotate + (rRotate - lRotate) * ratio;
    return 'translate(${_formatNumber(tx)}px,${_formatNumber(ty)}px) rotate(${_formatNumber(rot)}deg)';
  }

  (Offset, double)? _parseTransform(String value) {
    final translateMatch = RegExp(r'translate\(\s*([-0-9.]+)px\s*,\s*([-0-9.]+)px\s*\)').firstMatch(value);
    final rotateMatch = RegExp(r'rotate\(\s*([-0-9.]+)deg\s*\)').firstMatch(value);
    if (translateMatch == null || rotateMatch == null) {
      return null;
    }
    final tx = double.tryParse(translateMatch.group(1) ?? '');
    final ty = double.tryParse(translateMatch.group(2) ?? '');
    final rot = double.tryParse(rotateMatch.group(1) ?? '');
    if (tx == null || ty == null || rot == null) {
      return null;
    }
    return (Offset(tx, ty), rot);
  }

  void _applyCssProperties(XmlElement target, Map<String, String> properties) {
    final transform = properties['transform'];
    if (transform != null) {
      final parsed = _parseTransform(transform);
      if (parsed != null) {
        final translate = parsed.$1;
        final rotate = parsed.$2;
        final angle = rotate * math.pi / 180;
        final cosA = math.cos(angle);
        final sinA = math.sin(angle);
        target.setAttribute(
          'transform',
          'matrix(${_formatNumber(cosA)} ${_formatNumber(sinA)} ${_formatNumber(-sinA)} ${_formatNumber(cosA)} ${_formatNumber(translate.dx)} ${_formatNumber(translate.dy)})',
        );
      }
    }
    final opacity = properties['opacity'];
    if (opacity != null) {
      target.setAttribute('opacity', opacity);
    }
    final d = properties['d'];
    if (d != null) {
      final pathMatch = RegExp(r'''path\(['"](.+)['"]\)''').firstMatch(d);
      target.setAttribute('d', pathMatch?.group(1) ?? d);
    }
  }
}

class _CssKeyframes {
  final String name;
  final List<_CssFrame> frames;

  _CssKeyframes({required this.name, required this.frames});
}

class _CssFrame {
  final double percent;
  final Map<String, String> properties;

  _CssFrame({required this.percent, required this.properties});
}
