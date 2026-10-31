part of 'smil_css_svg_mvp_widget.dart';

// Reads declarative timeline data only; the bundled JavaScript is never run.
class _SvgatorTimeline {
  final List<_SvgatorElement> elements;
  final Duration duration;

  _SvgatorTimeline(this.elements, this.duration);

  static _SvgatorTimeline? parse(XmlDocument document) {
    final elements = <_SvgatorElement>[];
    var endTime = 0.0;
    for (final script in document.findAllElements('script')) {
      final source = script.innerText;
      if (!source.contains('__SVGATOR_PLAYER__')) {
        continue;
      }
      final marker = RegExp(r'\{\s*"root"\s*:').firstMatch(source);
      if (marker == null) {
        throw UnsupportedError('SVGator export has no readable timeline JSON.');
      }
      var depth = 0;
      var quoted = false;
      var escaped = false;
      var end = -1;
      for (var i = marker.start; i < source.length; i++) {
        final char = source[i];
        if (quoted) {
          if (escaped) {
            escaped = false;
          } else if (char == r'\') {
            escaped = true;
          } else if (char == '"') {
            quoted = false;
          }
        } else if (char == '"') {
          quoted = true;
        } else if (char == '{') {
          depth++;
        } else if (char == '}' && --depth == 0) {
          end = i + 1;
          break;
        }
      }
      if (end < 0) {
        throw const FormatException('Unterminated SVGator timeline JSON.');
      }
      final data = _svgatorMap(jsonDecode(source.substring(marker.start, end)));
      if (data['root'] != document.rootElement.getAttribute('id') || data['version'] != '2022-05-04') {
        throw UnsupportedError('Unsupported SVGator root or export version: ${data['version']}.');
      }
      final targets = {
        for (final element in document.descendants.whereType<XmlElement>())
          if (element.getAttribute('id') case final String id) id: element,
      };
      for (final animation in _svgatorList(data['animations'])) {
        final channelsById = _svgatorMap(_svgatorMap(animation)['elements']);
        for (final entry in channelsById.entries) {
          final target = targets[entry.key];
          if (target == null) {
            throw FormatException('SVGator target not found: ${entry.key}.');
          }
          final element = _SvgatorElement.parse(target, _svgatorMap(entry.value));
          elements.add(element);
          endTime = math.max(endTime, element.endTime);
        }
      }
    }
    return elements.isEmpty ? null : _SvgatorTimeline(elements, Duration(microseconds: (endTime * 1000).round()));
  }

  void apply(Map<String, XmlElement> targets, Duration time) {
    for (final element in elements) {
      element.apply(targets[element.id]!, time.inMicroseconds / 1000);
    }
  }
}

class _SvgatorElement {
  final String id;
  final Map<String, _SvgatorTrack> attributes;
  final Map<String, _SvgatorTrack> transforms;
  final Offset origin;
  final Offset scale;
  final Offset translation;
  final double rotation;

  _SvgatorElement(this.id, this.attributes, this.transforms, this.origin, this.scale, this.translation, this.rotation);

  factory _SvgatorElement.parse(XmlElement target, Map<String, Object?> properties) {
    final attributes = <String, _SvgatorTrack>{};
    final transforms = <String, _SvgatorTrack>{};
    var origin = Offset.zero;
    var scale = const Offset(1, 1);
    var translation = Offset.zero;
    var rotation = 0.0;
    final initial = target.getAttribute('transform');
    if (initial != null) {
      final matrix = RegExp(r'^matrix\(([^)]+)\)$').firstMatch(initial);
      final translate = RegExp(r'^translate\(([^)]+)\)$').firstMatch(initial);
      if (matrix != null) {
        final values = _parseNumList(matrix.group(1)!);
        if (values.length != 6) {
          throw const FormatException('Invalid SVGator base matrix.');
        }
        final sx = math.sqrt(values[0] * values[0] + values[1] * values[1]);
        final sy = sx == 0
            ? math.sqrt(values[2] * values[2] + values[3] * values[3])
            : (values[0] * values[3] - values[1] * values[2]) / sx;
        origin = Offset(values[4], values[5]);
        scale = Offset(sx, sy);
        rotation = math.atan2(values[1], values[0]) * 180 / math.pi;
      } else if (translate != null) {
        final values = _parseNumList(translate.group(1)!);
        origin = Offset(values.first, values.length > 1 ? values[1] : 0);
      } else {
        throw UnsupportedError('Unsupported SVGator base transform: $initial.');
      }
    }
    for (final property in properties.entries) {
      if (property.key == 'transform') {
        final transform = _svgatorMap(property.value);
        final data = transform['data'] == null ? <String, Object?>{} : _svgatorMap(transform['data']);
        for (final key in data.keys) {
          if (!const {'o', 's', 't', 'r'}.contains(key)) {
            throw UnsupportedError('Unsupported SVGator transform component: $key.');
          }
        }
        if (data['o'] != null) origin = _svgatorOffset(data['o']);
        if (data['s'] != null) scale = _svgatorOffset(data['s']);
        if (data['t'] != null) translation = _svgatorOffset(data['t']);
        if (data['r'] != null) rotation = _svgatorNumber(data['r']);
        for (final entry in _svgatorMap(transform['keys']).entries) {
          if (!const {'o', 's', 't', 'r'}.contains(entry.key)) {
            throw UnsupportedError('Unsupported SVGator transform track: ${entry.key}.');
          }
          transforms[entry.key] = _SvgatorTrack.parse(entry.value, entry.key == 'r' ? 'number' : 'point');
        }
      } else if (property.key == 'opacity' || property.key == 'd') {
        attributes[property.key] = _SvgatorTrack.parse(property.value, property.key == 'd' ? 'path' : 'number');
      } else {
        throw UnsupportedError('Unsupported SVGator property: ${property.key}.');
      }
    }
    return _SvgatorElement(target.getAttribute('id')!, attributes, transforms, origin, scale, translation, rotation);
  }

  double get endTime =>
      [...attributes.values, ...transforms.values].fold(0.0, (end, track) => math.max(end, track.keys.last.time));

  void apply(XmlElement target, double time) {
    for (final entry in attributes.entries) {
      final value = entry.value.sample(time);
      if (value is num) {
        target.setAttribute(entry.key, _formatNumber(value.toDouble().clamp(0, 1)));
      } else if (value is String) {
        final path = RegExp(r'''^path\('(.*)'\)$''', dotAll: true).firstMatch(value)!;
        target.setAttribute(entry.key, path.group(1)!);
      }
    }
    if (transforms.isEmpty) return;
    final o = transforms['o']?.sample(time) ?? origin;
    final s = transforms['s']?.sample(time) ?? scale;
    final t = transforms['t']?.sample(time) ?? translation;
    final r = transforms['r']?.sample(time) ?? rotation;
    if (o is! Offset || s is! Offset || t is! Offset || r is! num) {
      throw const FormatException('Invalid SVGator transform sample.');
    }
    final radians = r * math.pi / 180;
    final a = math.cos(radians) * s.dx;
    final b = math.sin(radians) * s.dx;
    final c = -math.sin(radians) * s.dy;
    final d = math.cos(radians) * s.dy;
    target.setAttribute(
      'transform',
      'matrix(${[a, b, c, d, o.dx + a * t.dx + c * t.dy, o.dy + b * t.dx + d * t.dy].map((value) => value.toStringAsFixed(9)).join(' ')})',
    );
    if (s.dx.abs() < 0.1 || s.dy.abs() < 0.1) {
      target.setAttribute('opacity', '0');
    }
  }
}

class _SvgatorKey {
  final double time;
  final Object value;
  final List<double> easing;

  _SvgatorKey(this.time, this.value, this.easing);
}

class _SvgatorTrack {
  final List<_SvgatorKey> keys;

  _SvgatorTrack(this.keys);

  factory _SvgatorTrack.parse(Object? source, String type) {
    final keys = <_SvgatorKey>[];
    for (final raw in _svgatorList(source)) {
      final key = _svgatorMap(raw);
      final rawValue = key['v'];
      final Object value;
      if (type == 'point') {
        final point = _svgatorMap(rawValue);
        final base = _svgatorOffset(rawValue);
        for (final handle in ['start', 'end']) {
          if (point[handle] != null && (_svgatorOffset(point[handle]) - base).distance > 0.00001) {
            throw UnsupportedError('Curved SVGator position tracks are not supported.');
          }
        }
        value = base;
      } else if (type == 'path') {
        final tokens = _svgatorList(rawValue).map((token) {
          if (token is num) return _formatNumber(token.toDouble());
          if (token is String && RegExp(r'^[MmLlHhVvCcSsQqTtAaZz]$').hasMatch(token)) return token;
          throw const FormatException('Invalid SVGator path token.');
        });
        value = "path('${tokens.join(' ')}')";
      } else {
        value = _svgatorNumber(rawValue);
      }
      final easing = key['e'] == null ? <double>[] : _svgatorList(key['e']).map(_svgatorNumber).toList();
      if (easing.isNotEmpty && easing.length != 2 && easing.length != 4) {
        throw UnsupportedError('Unsupported SVGator easing: $easing.');
      }
      keys.add(_SvgatorKey(_svgatorNumber(key['t']), value, easing));
    }
    if (keys.isEmpty) throw const FormatException('Empty SVGator keyframe track.');
    keys.sort((a, b) => a.time.compareTo(b.time));
    return _SvgatorTrack(keys);
  }

  Object sample(double time) {
    if (time <= keys.first.time) return keys.first.value;
    if (time >= keys.last.time) return keys.last.value;
    for (var i = 0; i < keys.length - 1; i++) {
      final left = keys[i];
      final right = keys[i + 1];
      if (time >= right.time) continue;
      final fraction = (time - left.time) / (right.time - left.time);
      final easing = left.easing;
      var progress = fraction;
      if (easing.length == 4) {
        progress = Cubic(easing[0], easing[1], easing[2], easing[3]).transform(fraction);
      } else if (easing.length == 2) {
        final steps = easing[0];
        if (steps <= 0) throw const FormatException('Invalid SVGator step count.');
        progress = ((fraction * steps).floor() + (easing[1] == 0 ? 1 : 0)) / steps;
        progress = progress.clamp(0, 1);
      }
      final start = left.value;
      final end = right.value;
      if (start is num && end is num) return start + (end - start) * progress;
      if (start is Offset && end is Offset) return start + (end - start) * progress;
      if (start is String && end is String) return _CssAnimBinding._interpolatePath(start, end, progress);
      throw const FormatException('Incompatible SVGator keyframe values.');
    }
    return keys.last.value;
  }
}

Map<String, Object?> _svgatorMap(Object? value) {
  if (value is Map<String, Object?>) return value;
  throw const FormatException('Expected an SVGator JSON object.');
}

List<Object?> _svgatorList(Object? value) {
  if (value is List<Object?>) return value;
  throw const FormatException('Expected an SVGator JSON array.');
}

double _svgatorNumber(Object? value) {
  if (value is num && value.isFinite) return value.toDouble();
  throw const FormatException('Expected a finite SVGator number.');
}

Offset _svgatorOffset(Object? value) {
  final point = _svgatorMap(value);
  return Offset(_svgatorNumber(point['x']), _svgatorNumber(point['y']));
}
