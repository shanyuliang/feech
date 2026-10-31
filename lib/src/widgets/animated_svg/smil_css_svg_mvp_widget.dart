import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui' show PathMetric;

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';

part 'svgator_timeline.dart';

class SmilCssSvgMvpWidget extends StatefulWidget {
  final String _svgSource;
  final _SmilSvgSourceType _sourceType;
  final Map<String, String>? headers;
  final bool loop;
  final int targetFrameRate;
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
    this.targetFrameRate = 60,
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
    this.targetFrameRate = 60,
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
    this.targetFrameRate = 60,
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
  AnimationController? _controller;
  List<String>? _frames;
  int _frameIndex = 0;
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
        final frames = engine.renderFrames(targetFrameRate: widget.targetFrameRate);
        _frames = frames.isEmpty ? [engine.renderAt(Duration.zero)] : frames;
        final duration = engine.timelineDuration;
        _controller = AnimationController(vsync: this, duration: duration)
          ..addListener(() {
            final cachedFrames = _frames;
            if (cachedFrames == null || cachedFrames.isEmpty) {
              return;
            }
            final idx = (_controller!.value * cachedFrames.length + 1e-9).floor().clamp(0, cachedFrames.length - 1);
            setState(() {
              _frameIndex = idx;
            });
          });
        if (widget.loop) {
          _controller!.repeat();
        } else {
          _controller!.forward(from: 0);
        }
        setState(() {
          _frameIndex = 0;
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
      return widget.errorBuilder?.call(context, _error!) ?? ErrorWidget(_error!);
    }
    final frames = _frames;
    if (frames == null || frames.isEmpty) {
      return widget.loadingBuilder?.call(context) ?? SizedBox(width: widget.width, height: widget.height);
    }
    final currentSvg = frames[_frameIndex.clamp(0, frames.length - 1)];
    return SvgPicture.string(
      currentSvg,
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
  final _SvgatorTimeline? _svgator;
  final Duration timelineDuration;

  _SmilSvgMvpEngine._(this._document, this._animations, this._cssAnimations, this._svgator, this.timelineDuration);

  factory _SmilSvgMvpEngine({required String svgXml}) {
    final document = XmlDocument.parse(svgXml);
    final animations = _parseSmilAnimations(document);
    final cssAnimations = _parseCssAnimations(document);
    final svgator = _SvgatorTimeline.parse(document);
    if (svgator != null) {
      for (final script in document.findAllElements('script').toList(growable: false)) {
        script.parent?.children.remove(script);
      }
    }
    final duration = _computeDuration(animations, cssAnimations);
    final combinedDuration = svgator != null && svgator.duration > duration ? svgator.duration : duration;
    return _SmilSvgMvpEngine._(document, animations, cssAnimations, svgator, combinedDuration);
  }

  static Duration _computeDuration(List<_SmilAnim> animations, List<_CssAnimBinding> cssAnimations) {
    if (animations.isEmpty && cssAnimations.isEmpty) {
      return const Duration(milliseconds: 500);
    }
    final smilMaxMs = animations.map((a) => a.timelineEnd.inMilliseconds).fold<int>(1, (acc, e) => math.max(acc, e));
    final cssMaxMs = cssAnimations.map((a) => a.timelineEndMs).fold<int>(1, (acc, e) => math.max(acc, e));
    return Duration(milliseconds: math.max(smilMaxMs, cssMaxMs));
  }

  static List<_SmilAnim> _parseSmilAnimations(XmlDocument document) {
    final all = <_SmilAnim>[];
    var autoIdCounter = 0;

    String ensureTargetId(XmlElement element) {
      final existing = element.getAttribute('id');
      if (existing != null && existing.isNotEmpty) {
        return existing;
      }
      final generated = '__smil_auto_${autoIdCounter++}';
      element.setAttribute('id', generated);
      return generated;
    }

    for (final element in document.descendants.whereType<XmlElement>()) {
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
              final targetId = ensureTargetId(element);
              final from = child.getAttribute('from') ?? element.getAttribute(attributeName) ?? '0';
              final to = child.getAttribute('to');
              final values = child.getAttribute('values');
              all.add(
                _SmilAnimate(
                  targetId: targetId,
                  attributeName: attributeName,
                  begin: begin,
                  dur: dur,
                  repeatCount: _parseRepeatCount(child.getAttribute('repeatCount')),
                  repeatDur: _parseRepeatDur(child.getAttribute('repeatDur')),
                  from: from,
                  to: to,
                  values: values,
                  calcMode: child.getAttribute('calcMode') ?? 'linear',
                  keyTimes: _parseKeyTimes(child.getAttribute('keyTimes')),
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
              final targetId = ensureTargetId(element);
              final from = child.getAttribute('from') ?? '';
              final to = child.getAttribute('to') ?? '';
              final values = child.getAttribute('values');
              all.add(
                _SmilAnimateTransform(
                  targetId: targetId,
                  begin: begin,
                  dur: dur,
                  repeatCount: _parseRepeatCount(child.getAttribute('repeatCount')),
                  repeatDur: _parseRepeatDur(child.getAttribute('repeatDur')),
                  transformType: transformType,
                  from: from,
                  to: to,
                  values: values,
                  calcMode: child.getAttribute('calcMode') ?? 'linear',
                  keyTimes: _parseKeyTimes(child.getAttribute('keyTimes')),
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
              final targetId = ensureTargetId(element);
              final begin = _parseClock(child.getAttribute('begin') ?? '0s');
              final dur = _parseClock(child.getAttribute('dur') ?? '0s');
              all.add(
                _SmilSet(
                  targetId: targetId,
                  attributeName: attributeName,
                  to: to,
                  begin: begin,
                  dur: dur,
                  repeatCount: _parseRepeatCount(child.getAttribute('repeatCount')),
                  repeatDur: _parseRepeatDur(child.getAttribute('repeatDur')),
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
    final selectorRegExp = RegExp(r'#([A-Za-z0-9\-_]+)\s*\{([^}]*)\}', multiLine: true);
    for (final selectorMatch in selectorRegExp.allMatches(styleText)) {
      final id = selectorMatch.group(1);
      final ruleBlock = selectorMatch.group(2);
      if (id == null || ruleBlock == null) {
        continue;
      }
      final properties = _parseCssProperties(ruleBlock);
      final rawAnimName = properties['animation-name'];
      final rawShorthand = properties['animation'];

      final List<String> animNames;
      if (rawAnimName != null && rawAnimName.trim().isNotEmpty) {
        animNames = _splitByComma(rawAnimName);
      } else if (rawShorthand != null && rawShorthand.trim().isNotEmpty) {
        animNames = _splitByComma(rawShorthand)
            .map(_extractAnimationName)
            .whereType<String>()
            .toList(growable: false);
      } else {
        continue;
      }

      final rawDuration = properties['animation-duration'];
      final durTokens = rawDuration != null ? _splitByComma(rawDuration) : const <String>[];
      final rawDelay = properties['animation-delay'];
      final delayTokens = rawDelay != null ? _splitByComma(rawDelay) : const <String>[];
      final rawIter = properties['animation-iteration-count'];
      final iterTokens = rawIter != null ? _splitByComma(rawIter) : const <String>[];
      final rawDir = properties['animation-direction'];
      final dirTokens = rawDir != null ? _splitByComma(rawDir) : const <String>[];

      for (var i = 0; i < animNames.length; i++) {
        final name = animNames[i];
        final keyframes = keyframesByName[name];
        if (keyframes == null || keyframes.frames.isEmpty) {
          continue;
        }

        final Duration? duration;
        if (durTokens.isNotEmpty) {
          duration = _extractDuration(durTokens[i % durTokens.length]);
        } else {
          duration = _extractDurationFromShorthand(rawShorthand);
        }
        if (duration == null) {
          continue;
        }

        final Duration delay;
        if (delayTokens.isNotEmpty) {
          delay = _extractDuration(delayTokens[i % delayTokens.length]) ?? Duration.zero;
        } else {
          delay = _extractDelayFromShorthand(rawShorthand) ?? Duration.zero;
        }

        final double? iterationCount;
        if (iterTokens.isNotEmpty) {
          iterationCount = _extractIterationCount(iterTokens[i % iterTokens.length]);
        } else {
          iterationCount = _extractIterationCount(rawShorthand);
        }

        final _CssDirection direction;
        if (dirTokens.isNotEmpty) {
          direction = _extractAnimationDirection(dirTokens[i % dirTokens.length]);
        } else {
          direction = _extractAnimationDirection(rawShorthand);
        }

        bindings.add(
          _CssAnimBinding(
            targetId: id,
            animationName: name,
            duration: duration,
            delay: delay,
            iterationCount: iterationCount,
            direction: direction,
            keyframes: keyframes,
            staticProperties: properties,
          ),
        );
      }
    }
    return bindings;
  }

  static List<String> _splitByComma(String text) {
    final result = <String>[];
    var depth = 0;
    var current = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final char = text[i];
      if (char == '(') {
        depth++;
        current.write(char);
      } else if (char == ')') {
        depth--;
        current.write(char);
      } else if (char == ',' && depth == 0) {
        final item = current.toString().trim();
        if (item.isNotEmpty) {
          result.add(item);
        }
        current = StringBuffer();
      } else {
        current.write(char);
      }
    }
    final item = current.toString().trim();
    if (item.isNotEmpty) {
      result.add(item);
    }
    return result;
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
    _svgator?.apply(map, t);
    for (final styleNode in cloned.findAllElements('style').toList(growable: false)) {
      styleNode.parent?.children.remove(styleNode);
    }
    return cloned.toXmlString(pretty: false);
  }

  List<String> renderFrames({required int targetFrameRate}) {
    final frameRate = targetFrameRate <= 0 ? 60 : targetFrameRate;
    final durationMs = math.max(1, timelineDuration.inMilliseconds);
    final frameCount = math.max(1, ((durationMs / 1000) * frameRate).round());
    final frames = <String>[];
    for (var i = 0; i < frameCount; i += 1) {
      final ms = ((i / frameCount) * durationMs).round();
      frames.add(renderAt(Duration(milliseconds: ms)));
    }
    return frames;
  }
}

Duration _parseClock(String value) {
  final trimmed = value.trim();
  if (trimmed.endsWith('min')) {
    final minutes = double.tryParse(trimmed.substring(0, trimmed.length - 3)) ?? 0;
    return Duration(milliseconds: (minutes * 60 * 1000).round());
  }
  if (trimmed.endsWith('h')) {
    final hours = double.tryParse(trimmed.substring(0, trimmed.length - 1)) ?? 0;
    return Duration(milliseconds: (hours * 60 * 60 * 1000).round());
  }
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

double? _parseRepeatCount(String? value) {
  if (value == null) {
    return 1;
  }
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return 1;
  }
  if (trimmed == 'indefinite') {
    return null;
  }
  return double.tryParse(trimmed) ?? 1;
}

Duration? _parseRepeatDur(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  if (value.trim() == 'indefinite') {
    return null;
  }
  return _parseClock(value);
}

List<double>? _parseKeyTimes(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  final items = value
      .split(RegExp(r'[;\s,]+'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .map((e) => double.tryParse(e))
      .whereType<double>()
      .toList(growable: false);
  if (items.length < 2) {
    return null;
  }
  return items;
}

String? _extractAnimationName(String? shorthand) {
  if (shorthand == null || shorthand.trim().isEmpty) {
    return null;
  }
  final tokens = shorthand.trim().split(RegExp(r'\s+'));
  for (final token in tokens) {
    if (!_looksLikeTimeToken(token) &&
        token != 'linear' &&
        token != 'ease' &&
        token != 'ease-in' &&
        token != 'ease-out' &&
        token != 'ease-in-out' &&
        token != 'infinite' &&
        token != 'normal' &&
        token != 'alternate' &&
        token != 'alternate-reverse' &&
        token != 'reverse' &&
        token != 'forwards' &&
        token != 'backwards' &&
        token != 'both' &&
        token != 'none' &&
        double.tryParse(token) == null) {
      return token;
    }
  }
  return null;
}

Duration? _extractDuration(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  final tokens = value.split(RegExp(r'\s+|,'));
  for (final token in tokens) {
    final t = token.trim();
    if (_looksLikeTimeToken(t)) {
      return _parseClock(t);
    }
  }
  return null;
}

Duration? _extractDurationFromShorthand(String? shorthand) {
  final times = _extractTimeTokens(shorthand);
  if (times.isEmpty) {
    return null;
  }
  return _parseClock(times.first);
}

Duration? _extractDelayFromShorthand(String? shorthand) {
  final times = _extractTimeTokens(shorthand);
  if (times.length < 2) {
    return null;
  }
  return _parseClock(times[1]);
}

List<String> _extractTimeTokens(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const [];
  }
  final tokens = value.split(RegExp(r'\s+|,')).map((e) => e.trim()).where((e) => e.isNotEmpty);
  return tokens.where(_looksLikeTimeToken).toList(growable: false);
}

Map<String, String> _parseStyleProperties(String block) {
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

bool _looksLikeTimeToken(String token) {
  return token.endsWith('ms') || token.endsWith('s') || token.endsWith('min') || token.endsWith('h');
}

double? _extractIterationCount(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 1;
  }
  if (value.contains('infinite')) {
    return null;
  }
  final tokens = value.split(RegExp(r'\s+|,'));
  for (final token in tokens) {
    final parsed = double.tryParse(token.trim());
    if (parsed != null) {
      return parsed;
    }
  }
  return 1;
}

_CssDirection _extractAnimationDirection(String? value) {
  if (value == null || value.trim().isEmpty) {
    return _CssDirection.normal;
  }
  if (value.contains('alternate-reverse')) {
    return _CssDirection.alternateReverse;
  }
  if (value.contains('alternate')) {
    return _CssDirection.alternate;
  }
  if (value.contains('reverse')) {
    return _CssDirection.reverse;
  }
  return _CssDirection.normal;
}

abstract class _SmilAnim {
  final String targetId;
  final Duration begin;
  final Duration dur;
  final double? repeatCount;
  final Duration? repeatDur;
  final bool fillFreeze;

  _SmilAnim({
    required this.targetId,
    required this.begin,
    required this.dur,
    required this.repeatCount,
    required this.repeatDur,
    required this.fillFreeze,
  });

  void apply(XmlElement target, Duration t);

  Duration get activeDuration {
    final byCount = repeatCount == null
        ? null
        : Duration(milliseconds: (dur.inMilliseconds * repeatCount!.clamp(0, double.infinity)).round());
    final byRepeatDur = repeatDur;
    if (byCount == null && byRepeatDur == null) {
      return dur;
    }
    if (byCount == null) {
      return byRepeatDur!;
    }
    if (byRepeatDur == null) {
      return byCount;
    }
    return byCount.inMilliseconds < byRepeatDur.inMilliseconds ? byCount : byRepeatDur;
  }

  Duration get timelineEnd => begin + activeDuration;

  double? progress(Duration t) {
    if (t < begin) {
      return null;
    }
    if (dur.inMilliseconds <= 0) {
      return null;
    }
    final elapsed = t - begin;
    final active = activeDuration;
    if ((repeatCount != null || repeatDur != null) && elapsed > active) {
      return fillFreeze ? 1 : null;
    }
    if (repeatCount == null) {
      final cycleMs = math.max(1, dur.inMilliseconds);
      final cycleElapsedMs = elapsed.inMilliseconds % cycleMs;
      return (cycleElapsedMs / cycleMs).clamp(0, 1);
    }
    if (dur.inMilliseconds <= 0) {
      return null;
    }
    if (elapsed == active && fillFreeze) {
      return 1;
    }
    final cycleMs = math.max(1, dur.inMilliseconds);
    final cycleElapsedMs = elapsed.inMilliseconds % cycleMs;
    return (cycleElapsedMs / cycleMs).clamp(0, 1);
  }
}

class _SmilAnimate extends _SmilAnim {
  final String attributeName;
  final String from;
  final String? to;
  final String? values;
  final String calcMode;
  final List<double>? keyTimes;

  _SmilAnimate({
    required super.targetId,
    required super.begin,
    required super.dur,
    required super.repeatCount,
    required super.repeatDur,
    required super.fillFreeze,
    required this.attributeName,
    required this.from,
    required this.to,
    required this.values,
    required this.calcMode,
    required this.keyTimes,
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
        final (left, right, localP) = _segmentForProgress(p, keyValues.length, keyTimes);
        final effectiveP = calcMode == 'discrete' ? 0.0 : localP;
        final leftNum = double.tryParse(keyValues[left]);
        final rightNum = double.tryParse(keyValues[right]);
        if (leftNum != null && rightNum != null) {
          final v = leftNum + (rightNum - leftNum) * effectiveP;
          target.setAttribute(attributeName, _formatNumber(v));
        } else {
          target.setAttribute(attributeName, calcMode == 'discrete' ? keyValues[left] : (effectiveP < 0.5 ? keyValues[left] : keyValues[right]));
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
    required super.repeatCount,
    required super.repeatDur,
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
  final String? values;
  final String calcMode;
  final List<double>? keyTimes;

  _SmilAnimateTransform({
    required super.targetId,
    required super.begin,
    required super.dur,
    required super.repeatCount,
    required super.repeatDur,
    required super.fillFreeze,
    required this.transformType,
    required this.from,
    required this.to,
    required this.values,
    required this.calcMode,
    required this.keyTimes,
  });

  @override
  void apply(XmlElement target, Duration t) {
    final p = progress(t);
    if (p == null) {
      return;
    }

    if (values != null && values!.contains(';')) {
      final keyValues = values!.split(';').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(growable: false);
      if (keyValues.length >= 2) {
        final (left, right, localP) = _segmentForProgress(p, keyValues.length, keyTimes);
        final leftValues = _parseNumList(keyValues[left]);
        final rightValues = _parseNumList(keyValues[right]);
        final interpolated = _interpolateTransform(leftValues, rightValues, calcMode == 'discrete' ? 0.0 : localP);
        if (interpolated.isNotEmpty) {
          _setTransform(target, interpolated);
        }
      }
      return;
    }

    final fromValues = _parseNumList(from);
    final toValues = _parseNumList(to);
    final interpolated = _interpolateTransform(fromValues, toValues, p);
    if (interpolated.isEmpty) {
      return;
    }

    _setTransform(target, interpolated);
  }

  List<double> _interpolateTransform(List<double> fromValues, List<double> toValues, double progress) {
    if (fromValues.isEmpty || toValues.isEmpty) {
      return const [];
    }
    final maxLen = math.min(fromValues.length, toValues.length);
    final current = <double>[];
    for (var i = 0; i < maxLen; i += 1) {
      current.add(fromValues[i] + (toValues[i] - fromValues[i]) * progress);
    }
    return current;
  }

  void _setTransform(XmlElement target, List<double> current) {
    if (transformType == 'translate' && current.length >= 2) {
      target.setAttribute('transform', 'translate(${_formatNumber(current[0])} ${_formatNumber(current[1])})');
      return;
    }
    if (transformType == 'rotate' && current.isNotEmpty) {
      target.setAttribute('transform', 'rotate(${current.map(_formatNumber).join(' ')})');
      return;
    }
    if (transformType == 'scale' && current.isNotEmpty) {
      target.setAttribute('transform', 'scale(${current.map(_formatNumber).join(' ')})');
      return;
    }
    target.setAttribute('transform', '$transformType(${current.map(_formatNumber).join(' ')})');
  }
}

(int, int, double) _segmentForProgress(double progress, int valueCount, List<double>? keyTimes) {
  if (valueCount <= 1) {
    return (0, 0, 0);
  }
  if (keyTimes == null || keyTimes.length != valueCount) {
    final position = (progress * (valueCount - 1)).clamp(0, valueCount - 1).toDouble();
    final left = position.floor();
    final right = math.min(valueCount - 1, left + 1);
    return (left, right, position - left);
  }
  for (var i = 0; i < keyTimes.length - 1; i += 1) {
    final leftT = keyTimes[i];
    final rightT = keyTimes[i + 1];
    if (progress >= leftT && progress <= rightT) {
      final denom = (rightT - leftT).abs() < 1e-9 ? 1.0 : (rightT - leftT);
      final local = ((progress - leftT) / denom).clamp(0, 1).toDouble();
      return (i, i + 1, local);
    }
  }
  return (valueCount - 2, valueCount - 1, 1);
}

List<double> _parseNumList(String value) {
  return RegExp(r'[-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?')
      .allMatches(value)
      .map((m) => double.tryParse(m.group(0)!))
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
  final Duration delay;
  final double? iterationCount;
  final _CssDirection direction;
  final _CssKeyframes keyframes;
  final Map<String, String> staticProperties;

  _CssAnimBinding({
    required this.targetId,
    required this.animationName,
    required this.duration,
    required this.delay,
    required this.iterationCount,
    required this.direction,
    required this.keyframes,
    required this.staticProperties,
  });

  int get timelineEndMs {
    if (iterationCount == null) {
      return duration.inMilliseconds;
    }
    final total = delay.inMilliseconds + (duration.inMilliseconds * iterationCount!).round();
    return math.max(duration.inMilliseconds, total);
  }

  void apply(XmlElement target, Duration t, Duration timelineDuration) {
    if (keyframes.frames.isEmpty) {
      return;
    }
    if (t < delay) {
      return;
    }
    final durationMs = math.max(1, duration.inMilliseconds);
    final elapsedMs = t.inMilliseconds - delay.inMilliseconds;
    if (iterationCount != null) {
      final maxMs = (durationMs * iterationCount!).round();
      if (elapsedMs > maxMs) {
        final lastDirection = _directionForIteration(iterationCount!.ceil() - 1);
        final frozenPercent = lastDirection ? 0.0 : 100.0;
        final frozen = _frameAt(frozenPercent);
        if (frozen != null) {
          _applyCssProperties(target, frozen.properties, staticProperties);
        }
        return;
      }
    }
    final cycleIndex = elapsedMs ~/ durationMs;
    final inCycleMs = elapsedMs % durationMs;
    final reverseCycle = _directionForIteration(cycleIndex);
    var cycleProgress = (inCycleMs / durationMs).clamp(0, 1).toDouble();
    if (reverseCycle) {
      cycleProgress = 1 - cycleProgress;
    }
    final progressPercent = cycleProgress * 100;
    final current = _frameAt(progressPercent);
    if (current == null) {
      return;
    }
    _applyCssProperties(target, current.properties, staticProperties);
  }

  bool _directionForIteration(int cycleIndex) {
    switch (direction) {
      case _CssDirection.normal:
        return false;
      case _CssDirection.reverse:
        return true;
      case _CssDirection.alternate:
        return cycleIndex.isOdd;
      case _CssDirection.alternateReverse:
        return cycleIndex.isEven;
    }
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
        final linearRatio = ((percent - left.percent) / (right.percent - left.percent)).clamp(0, 1).toDouble();
        final tf = left.properties['animation-timing-function'];
        final ratio = _applyEasing(linearRatio, tf);
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
      if (key == 'offset-distance') {
        final percentage = RegExp(r'^([-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?)%$');
        final leftMatch = percentage.firstMatch(lv.trim());
        final rightMatch = percentage.firstMatch(rv.trim());
        if (leftMatch != null && rightMatch != null) {
          final start = double.parse(leftMatch.group(1)!);
          final end = double.parse(rightMatch.group(1)!);
          out[key] = '${_formatNumber(start + (end - start) * ratio)}%';
          continue;
        }
      }
      if (key == 'opacity') {
        final lNum = double.tryParse(lv);
        final rNum = double.tryParse(rv);
        if (lNum != null && rNum != null) {
          out[key] = _formatNumber(lNum + (rNum - lNum) * ratio);
          continue;
        }
      }
      if (key == 'fill' || key == 'stroke' || key == 'stop-color' || key == 'color') {
        final colorStr = _RgbaColor.interpolate(lv, rv, ratio);
        if (colorStr != null) {
          out[key] = colorStr;
          continue;
        }
      }
      if (key == 'transform') {
        out[key] = _interpolateTransform(lv, rv, ratio);
        continue;
      }
      if (key == 'd') {
        out[key] = _interpolatePath(lv, rv, ratio);
        continue;
      }
      out[key] = ratio < 0.5 ? lv : rv;
    }
    return out;
  }

  static String _interpolatePath(String left, String right, double ratio) {
    final cleanLeft = left.replaceAll(RegExp(r'''^\s*path\(\s*['"]?|['"]?\s*\)\s*$'''), '').replaceAll(RegExp(r'''^['"]|['"]$'''), '');
    final cleanRight = right.replaceAll(RegExp(r'''^\s*path\(\s*['"]?|['"]?\s*\)\s*$'''), '').replaceAll(RegExp(r'''^['"]|['"]$'''), '');
    final token = RegExp(r'[-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?|[MmLlHhVvCcSsQqTtAaZz]');
    final leftTokens = token.allMatches(cleanLeft).map((match) => match.group(0)!).toList();
    final rightTokens = token.allMatches(cleanRight).map((match) => match.group(0)!).toList();
    if (leftTokens.length != rightTokens.length ||
        cleanLeft.replaceAll(token, '').replaceAll(RegExp(r'[\s,]'), '').isNotEmpty ||
        cleanRight.replaceAll(token, '').replaceAll(RegExp(r'[\s,]'), '').isNotEmpty) {
      return ratio < 0.5 ? "path('$cleanLeft')" : "path('$cleanRight')";
    }
    final result = <String>[];
    var command = '';
    var argumentIndex = 0;
    for (var i = 0; i < leftTokens.length; i++) {
      final start = double.tryParse(leftTokens[i]);
      final end = double.tryParse(rightTokens[i]);
      if (start == null || end == null) {
        if (start != null || end != null || leftTokens[i] != rightTokens[i]) {
          return ratio < 0.5 ? "path('$cleanLeft')" : "path('$cleanRight')";
        }
        command = leftTokens[i].toUpperCase();
        argumentIndex = 0;
        result.add(leftTokens[i]);
      } else {
        final isArcFlag = command == 'A' && (argumentIndex % 7 == 3 || argumentIndex % 7 == 4);
        result.add(isArcFlag ? (ratio < 0.5 ? leftTokens[i] : rightTokens[i]) : _formatNumber(start + (end - start) * ratio));
        argumentIndex++;
      }
    }
    return "path('${result.join(' ')}')";
  }

  String _interpolateTransform(String left, String right, double ratio) {
    final lParsed = _parseTransform(left);
    final rParsed = _parseTransform(right);
    if (lParsed == null || rParsed == null) {
      return ratio < 0.5 ? left : right;
    }
    final tx = lParsed.translate.dx + (rParsed.translate.dx - lParsed.translate.dx) * ratio;
    final ty = lParsed.translate.dy + (rParsed.translate.dy - lParsed.translate.dy) * ratio;
    final rot = lParsed.rotateDeg + (rParsed.rotateDeg - lParsed.rotateDeg) * ratio;
    final sx = lParsed.scale.dx + (rParsed.scale.dx - lParsed.scale.dx) * ratio;
    final sy = lParsed.scale.dy + (rParsed.scale.dy - lParsed.scale.dy) * ratio;
    final skx = lParsed.skewXDeg + (rParsed.skewXDeg - lParsed.skewXDeg) * ratio;
    final sky = lParsed.skewYDeg + (rParsed.skewYDeg - lParsed.skewYDeg) * ratio;

    final interp = _TransformComponents(
      translate: Offset(tx, ty),
      rotateDeg: rot,
      scale: Offset(sx, sy),
      skewXDeg: skx,
      skewYDeg: sky,
    );
    final m = interp.toMatrix();
    return 'matrix(${_formatNumber(m.a)} ${_formatNumber(m.b)} ${_formatNumber(m.c)} ${_formatNumber(m.d)} ${_formatNumber(m.e)} ${_formatNumber(m.f)})';
  }

  _TransformComponents? _parseTransform(String value) {
    final transformRegExp = RegExp(r'([a-zA-Z]+)\(([^)]*)\)');
    var translate = Offset.zero;
    var rotateDeg = 0.0;
    var scale = const Offset(1, 1);
    var skewXDeg = 0.0;
    var skewYDeg = 0.0;
    var foundAny = false;
    for (final match in transformRegExp.allMatches(value)) {
      final name = (match.group(1) ?? '').trim();
      final args = _parseNumList(match.group(2) ?? '');
      if (name == 'translate' && args.isNotEmpty) {
        translate = Offset(args[0], args.length > 1 ? args[1] : 0);
        foundAny = true;
      } else if (name == 'rotate' && args.isNotEmpty) {
        rotateDeg = args[0];
        foundAny = true;
      } else if (name == 'scale' && args.isNotEmpty) {
        final sx = args[0];
        final sy = args.length > 1 ? args[1] : sx;
        scale = Offset(sx, sy);
        foundAny = true;
      } else if (name == 'skewX' && args.isNotEmpty) {
        skewXDeg = args[0];
        foundAny = true;
      } else if (name == 'skewY' && args.isNotEmpty) {
        skewYDeg = args[0];
        foundAny = true;
      } else if (name == 'skew' && args.isNotEmpty) {
        skewXDeg = args[0];
        skewYDeg = args.length > 1 ? args[1] : 0;
        foundAny = true;
      } else if (name == 'matrix' && args.length >= 6) {
        // matrix(a, b, c, d, e, f)
        final a = args[0], b = args[1], c = args[2], d = args[3], e = args[4], f = args[5];
        translate = Offset(e, f);
        rotateDeg = math.atan2(b, a) * 180 / math.pi;
        scale = Offset(math.sqrt(a * a + b * b), math.sqrt(c * c + d * d));
        foundAny = true;
      }
    }
    if (!foundAny) {
      return null;
    }
    return _TransformComponents(
      translate: translate,
      rotateDeg: rotateDeg,
      scale: scale,
      skewXDeg: skewXDeg,
      skewYDeg: skewYDeg,
    );
  }

  void _applyCssProperties(
    XmlElement target,
    Map<String, String> properties,
    Map<String, String> staticProperties,
  ) {
    final inlineStyle = _parseStyleProperties(target.getAttribute('style') ?? '');
    final mergedStatic = <String, String>{...staticProperties, ...inlineStyle};
    final offsetPathSampler = _OffsetPathSampler.fromCssOffsetPath(mergedStatic['offset-path']);
    final transform = properties['transform'];
    Offset motionOffset = Offset.zero;
    final offsetDistance = properties['offset-distance'];
    if (offsetDistance != null) {
      final percentMatch = RegExp(r'([-+]?[0-9]*\.?[0-9]+)%').firstMatch(offsetDistance);
      final percent = double.tryParse(percentMatch?.group(1) ?? '');
      if (percent != null) {
        motionOffset = offsetPathSampler.sampleAtPercent(percent.clamp(0, 100).toDouble());
      }
    }
    if (transform != null) {
      final parsed = _parseTransform(transform);
      if (parsed != null) {
        final withMotion = _TransformComponents(
          translate: parsed.translate + motionOffset,
          rotateDeg: parsed.rotateDeg,
          scale: parsed.scale,
          skewXDeg: parsed.skewXDeg,
          skewYDeg: parsed.skewYDeg,
        );
        final m = withMotion.toMatrix();
        target.setAttribute(
          'transform',
          'matrix(${_formatNumber(m.a)} ${_formatNumber(m.b)} ${_formatNumber(m.c)} ${_formatNumber(m.d)} ${_formatNumber(m.e)} ${_formatNumber(m.f)})',
        );
      } else {
        target.setAttribute('transform', transform);
      }
    } else if (motionOffset != Offset.zero) {
      target.setAttribute('transform', 'translate(${_formatNumber(motionOffset.dx)} ${_formatNumber(motionOffset.dy)})');
    }

    properties.forEach((key, value) {
      if (key == 'transform' || key == 'offset-distance' || key == 'animation-timing-function') {
        return;
      }
      if (key == 'opacity') {
        target.setAttribute('opacity', value);
      } else if (key == 'd') {
        final cleanPath = value.replaceAll(RegExp(r'''^\s*path\(\s*['"]?|['"]?\s*\)\s*$'''), '').replaceAll(RegExp(r'''^['"]|['"]$'''), '');
        target.setAttribute('d', cleanPath);
      } else {
        target.setAttribute(key, value);
      }
    });
  }
}

double _applyEasing(double t, String? timingFunction) {
  if (timingFunction == null || timingFunction.trim().isEmpty) {
    return t;
  }
  final tf = timingFunction.trim();
  if (tf == 'linear') return t;
  if (tf == 'step-start') return t >= 1.0 ? 1.0 : (t > 0.0 ? 1.0 : 0.0);
  if (tf == 'step-end') return t >= 1.0 ? 1.0 : 0.0;
  if (tf == 'ease') return _cubicBezier(0.25, 0.1, 0.25, 1.0, t);
  if (tf == 'ease-in') return _cubicBezier(0.42, 0.0, 1.0, 1.0, t);
  if (tf == 'ease-out') return _cubicBezier(0.0, 0.0, 0.58, 1.0, t);
  if (tf == 'ease-in-out') return _cubicBezier(0.42, 0.0, 0.58, 1.0, t);
  final stepsMatch = RegExp(
    r'^steps\(\s*(\d+)\s*(?:,\s*(start|end|jump-start|jump-end|jump-both|jump-none)\s*)?\)$',
  ).firstMatch(tf);
  if (stepsMatch != null) {
    final stepsCount = int.parse(stepsMatch.group(1)!);
    final pos = stepsMatch.group(2) ?? 'end';
    if (stepsCount > 0) {
      if (pos == 'start' || pos == 'jump-start') {
        final step = (t * stepsCount).floor() + 1;
        return (step / stepsCount).clamp(0.0, 1.0);
      } else {
        final step = (t * stepsCount).floor();
        return (step / stepsCount).clamp(0.0, 1.0);
      }
    }
  }
  final match = RegExp(
    r'^cubic-bezier\(\s*([-+]?[0-9]*\.?[0-9]+)\s*,\s*([-+]?[0-9]*\.?[0-9]+)\s*,\s*([-+]?[0-9]*\.?[0-9]+)\s*,\s*([-+]?[0-9]*\.?[0-9]+)\s*\)$',
  ).firstMatch(tf);
  if (match != null) {
    final x1 = double.tryParse(match.group(1)!);
    final y1 = double.tryParse(match.group(2)!);
    final x2 = double.tryParse(match.group(3)!);
    final y2 = double.tryParse(match.group(4)!);
    if (x1 != null && y1 != null && x2 != null && y2 != null) {
      return _cubicBezier(x1, y1, x2, y2, t);
    }
  }
  return t;
}

double _cubicBezier(double x1, double y1, double x2, double y2, double t) {
  if (t <= 0) return 0;
  if (t >= 1) return 1;
  if (x1 == y1 && x2 == y2) return t;

  double sampleX(double s) {
    final invS = 1.0 - s;
    return 3.0 * invS * invS * s * x1 + 3.0 * invS * s * s * x2 + s * s * s;
  }

  double sampleY(double s) {
    final invS = 1.0 - s;
    return 3.0 * invS * invS * s * y1 + 3.0 * invS * s * s * y2 + s * s * s;
  }

  double s = t;
  for (var i = 0; i < 8; i++) {
    final currentX = sampleX(s) - t;
    if (currentX.abs() < 1e-6) break;
    final invS = 1.0 - s;
    final dX = 3.0 * invS * invS * x1 + 6.0 * invS * s * (x2 - x1) + 3.0 * s * s * (1.0 - x2);
    if (dX.abs() < 1e-6) break;
    s -= currentX / dX;
    s = s.clamp(0.0, 1.0);
  }

  if ((sampleX(s) - t).abs() > 1e-3) {
    double low = 0.0, high = 1.0;
    s = t;
    while (high - low > 1e-5) {
      final mid = (low + high) / 2;
      if (sampleX(mid) < t) {
        low = mid;
      } else {
        high = mid;
      }
      s = mid;
    }
  }

  return sampleY(s).clamp(0.0, 1.0);
}

class _RgbaColor {
  final int r, g, b;
  final double a;
  const _RgbaColor(this.r, this.g, this.b, [this.a = 1.0]);

  static _RgbaColor? tryParse(String val) {
    val = val.trim();
    if (val.startsWith('#')) {
      final hex = val.substring(1);
      if (hex.length == 3) {
        final r = int.parse(hex[0] * 2, radix: 16);
        final g = int.parse(hex[1] * 2, radix: 16);
        final b = int.parse(hex[2] * 2, radix: 16);
        return _RgbaColor(r, g, b);
      } else if (hex.length == 6) {
        final r = int.parse(hex.substring(0, 2), radix: 16);
        final g = int.parse(hex.substring(2, 4), radix: 16);
        final b = int.parse(hex.substring(4, 6), radix: 16);
        return _RgbaColor(r, g, b);
      } else if (hex.length == 8) {
        final r = int.parse(hex.substring(0, 2), radix: 16);
        final g = int.parse(hex.substring(2, 4), radix: 16);
        final b = int.parse(hex.substring(4, 6), radix: 16);
        final a = int.parse(hex.substring(6, 8), radix: 16) / 255.0;
        return _RgbaColor(r, g, b, a);
      }
    }
    final rgbMatch = RegExp(r'^rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*([0-9.]+)\s*)?\)$').firstMatch(val);
    if (rgbMatch != null) {
      final r = int.parse(rgbMatch.group(1)!);
      final g = int.parse(rgbMatch.group(2)!);
      final b = int.parse(rgbMatch.group(3)!);
      final aStr = rgbMatch.group(4);
      final a = aStr != null ? double.parse(aStr) : 1.0;
      return _RgbaColor(r, g, b, a);
    }
    return null;
  }

  static String? interpolate(String leftStr, String rightStr, double ratio) {
    final c1 = tryParse(leftStr);
    final c2 = tryParse(rightStr);
    if (c1 == null || c2 == null) return null;
    final r = (c1.r + (c2.r - c1.r) * ratio).round().clamp(0, 255);
    final g = (c1.g + (c2.g - c1.g) * ratio).round().clamp(0, 255);
    final b = (c1.b + (c2.b - c1.b) * ratio).round().clamp(0, 255);
    final a = c1.a + (c2.a - c1.a) * ratio;
    if (a >= 0.999) {
      return 'rgb($r,$g,$b)';
    }
    return 'rgba($r,$g,$b,${_formatNumber(a.clamp(0.0, 1.0))})';
  }
}

class _Matrix2D {
  final double a, b, c, d, e, f;
  const _Matrix2D(this.a, this.b, this.c, this.d, this.e, this.f);

  _Matrix2D multiply(_Matrix2D o) {
    return _Matrix2D(
      a * o.a + c * o.b,
      b * o.a + d * o.b,
      a * o.c + c * o.d,
      b * o.c + d * o.d,
      a * o.e + c * o.f + e,
      b * o.e + d * o.f + f,
    );
  }

  static _Matrix2D translate(double tx, double ty) => _Matrix2D(1, 0, 0, 1, tx, ty);
  static _Matrix2D rotate(double deg) {
    final rad = deg * math.pi / 180;
    final cosA = math.cos(rad);
    final sinA = math.sin(rad);
    return _Matrix2D(cosA, sinA, -sinA, cosA, 0, 0);
  }
  static _Matrix2D scale(double sx, double sy) => _Matrix2D(sx, 0, 0, sy, 0, 0);
  static _Matrix2D skewX(double deg) => _Matrix2D(1, 0, math.tan(deg * math.pi / 180), 1, 0, 0);
  static _Matrix2D skewY(double deg) => _Matrix2D(1, math.tan(deg * math.pi / 180), 0, 1, 0, 0);
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

enum _CssDirection { normal, reverse, alternate, alternateReverse }

class _TransformComponents {
  final Offset translate;
  final double rotateDeg;
  final Offset scale;
  final double skewXDeg;
  final double skewYDeg;

  _TransformComponents({
    required this.translate,
    required this.rotateDeg,
    required this.scale,
    this.skewXDeg = 0.0,
    this.skewYDeg = 0.0,
  });

  _Matrix2D toMatrix() {
    return _Matrix2D.translate(translate.dx, translate.dy)
        .multiply(_Matrix2D.rotate(rotateDeg))
        .multiply(_Matrix2D.skewX(skewXDeg))
        .multiply(_Matrix2D.skewY(skewYDeg))
        .multiply(_Matrix2D.scale(scale.dx, scale.dy));
  }
}

class _OffsetPathSampler {
  final List<PathMetric> _metrics;
  final double _totalLength;

  _OffsetPathSampler._(this._metrics, this._totalLength);

  factory _OffsetPathSampler.fromCssOffsetPath(String? offsetPath) {
    if (offsetPath == null) {
      return _OffsetPathSampler._(const [], 0);
    }
    final pathMatch = RegExp(r'''path\(['"](.+)['"]\)''').firstMatch(offsetPath);
    final pathData = pathMatch?.group(1);
    if (pathData == null || pathData.trim().isEmpty) {
      return _OffsetPathSampler._(const [], 0);
    }
    try {
      final path = parseSvgPathData(pathData);
      final metrics = path.computeMetrics(forceClosed: false).toList(growable: false);
      final totalLength = metrics.fold<double>(0, (sum, metric) => sum + metric.length);
      return _OffsetPathSampler._(metrics, totalLength);
    } catch (_) {
      return _OffsetPathSampler._(const [], 0);
    }
  }

  Offset sampleAtPercent(double percent) {
    if (_metrics.isEmpty || _totalLength <= 0) {
      return Offset.zero;
    }
    final target = _totalLength * (percent / 100);
    var traversed = 0.0;
    for (final metric in _metrics) {
      final end = traversed + metric.length;
      if (target <= end) {
        final tangent = metric.getTangentForOffset((target - traversed).clamp(0, metric.length));
        if (tangent != null) {
          return tangent.position;
        }
        return Offset.zero;
      }
      traversed = end;
    }
    final tangent = _metrics.last.getTangentForOffset(_metrics.last.length);
    return tangent?.position ?? Offset.zero;
  }
}
