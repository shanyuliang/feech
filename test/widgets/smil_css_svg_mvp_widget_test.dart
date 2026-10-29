import 'dart:io';
import 'dart:math' as math;

import 'package:feech/feech.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:xml/xml.dart';

void main() {
  testWidgets('unsupported SVGator channels surface an import error', (tester) async {
    Object? importError;
    await tester.pumpWidget(
      MaterialApp(
        home: SmilCssSvgMvpWidget.string(
          svgXml: '''
<svg xmlns="http://www.w3.org/2000/svg" id="sample" viewBox="0 0 10 10">
<g id="target"/>
<script><![CDATA[
// __SVGATOR_PLAYER__
{"root":"sample","version":"2022-05-04","animations":[{"elements":{"target":{"unknown":[]}}}]}
]]></script>
</svg>''',
          errorBuilder: (context, error) {
            importError = error;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pump();
    expect(importError, isA<UnsupportedError>());
    expect(importError.toString(), contains('Unsupported SVGator property: unknown'));
    expect(find.byType(SvgPicture), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('coffee SVGator mug flies, rotates, morphs, and repeats without scripts', (tester) async {
    final svg = File('assets/images/coffee.svg').readAsStringSync();
    Object? importError;
    await tester.pumpWidget(
      MaterialApp(
        home: SmilCssSvgMvpWidget.string(
          svgXml: svg,
          targetFrameRate: 100,
          width: 300,
          height: 200,
          errorBuilder: (context, error) {
            importError = error;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pump();
    expect(importError, isNull);

    XmlDocument currentFrame() {
      final picture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      final loader = picture.bytesLoader as SvgStringLoader;
      return XmlDocument.parse(loader.provideSvg(null));
    }

    XmlElement element(XmlDocument frame, String id) =>
        frame.descendants.whereType<XmlElement>().singleWhere((element) => element.getAttribute('id') == id);

    List<double> mugMatrix(XmlDocument frame) =>
        RegExp(r'[-+]?(?:\d+\.?\d*|\.\d+)')
            .allMatches(element(frame, 'eAOImkLDEno16').getAttribute('transform')!)
            .map((match) => double.parse(match.group(0)!))
            .toList();

    final initial = currentFrame();
    expect(initial.findAllElements('script'), isEmpty);
    final initialMatrix = mugMatrix(initial);
    expect(initialMatrix, hasLength(6));
    expect(initialMatrix[0], closeTo(0.63702, 0.0001));
    expect(initialMatrix[4], closeTo(206.560766, 0.0001));
    expect(initialMatrix[5], closeTo(-116.311508, 0.0001));

    final positions = <String>{};
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 10));
      positions.add(element(currentFrame(), 'eAOImkLDEno16').getAttribute('transform')!);
    }
    expect(positions.length, 20, reason: 'The mug must move continuously, not jump between keyframes.');
    await tester.pump(const Duration(milliseconds: 200));
    final at400 = currentFrame();
    final matrix = mugMatrix(at400);
    // Applying the matrix to the mug's pivot must recover the keyed position.
    expect(matrix[0] * 569.06927 + matrix[2] * 703.992096 + matrix[4], closeTo(569.075014, 0.01));
    expect(matrix[1] * 569.06927 + matrix[3] * 703.992096 + matrix[5], closeTo(702.842133, 0.01));
    expect(math.atan2(matrix[1], matrix[0]) * 180 / math.pi, closeTo(-10.545481, 0.01));
    final handle = element(at400, 'eAOImkLDEno19').getAttribute('d');
    await tester.pump(const Duration(milliseconds: 50));
    final at450 = currentFrame();
    expect(element(at450, 'eAOImkLDEno19').getAttribute('d'), isNot(handle));
    expect(element(at450, 'eAOImkLDEno17').getAttribute('opacity'), '1');
    final repeatedTransform = element(at450, 'eAOImkLDEno16').getAttribute('transform');
    await tester.pump(const Duration(milliseconds: 2340));
    expect(element(currentFrame(), 'eAOImkLDEno16').getAttribute('transform'), repeatedTransform);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('nature bee and white lines move on consecutive frames and repeat', (tester) async {
    final svg = File('assets/images/nature.svg').readAsStringSync();
    await tester.pumpWidget(MaterialApp(home: SmilCssSvgMvpWidget.string(svgXml: svg, width: 300, height: 200)));
    await tester.pump();

    XmlDocument currentFrame() {
      final picture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      final loader = picture.bytesLoader as SvgStringLoader;
      return XmlDocument.parse(loader.provideSvg(null));
    }

    String attribute(XmlDocument document, String id, String name) {
      return document.descendants
          .whereType<XmlElement>()
          .singleWhere((element) => element.getAttribute('id') == id)
          .getAttribute(name)!;
    }

    final positions = <String>[];
    final firstLine = <String>[];
    final secondLine = <String>[];
    for (var i = 0; i < 60; i++) {
      await tester.pump(const Duration(microseconds: 16667));
      final frame = currentFrame();
      positions.add(attribute(frame, 'eSfF1urTRx053_to', 'transform'));
      firstLine.add(attribute(frame, 'eSfF1urTRx051', 'd'));
      secondLine.add(attribute(frame, 'eSfF1urTRx073', 'd'));
    }
    expect(positions.toSet().length, 60, reason: 'Motion distance must interpolate on every 60 Hz frame.');
    expect(firstLine.toSet().length, 60, reason: 'The first white line must morph on every frame.');
    expect(secondLine.toSet().length, 60, reason: 'The second white line must morph on every frame.');
    await tester.pump(const Duration(seconds: 3));
    final repeated = currentFrame();
    expect(attribute(repeated, 'eSfF1urTRx053_to', 'transform'), positions.last);
    expect(attribute(repeated, 'eSfF1urTRx051', 'd'), firstLine.last);
    expect(attribute(repeated, 'eSfF1urTRx073', 'd'), secondLine.last);
    await tester.pump(const Duration(milliseconds: 500));
    final midpoint = currentFrame();
    expect(attribute(midpoint, 'eSfF1urTRx051', 'd'), startsWith('M 19.52 422.0219'));
    expect(attribute(midpoint, 'eSfF1urTRx073', 'd'), startsWith('M 23.42 635.845'));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('SmilCssSvgMvpWidget can load nature.svg without throwing', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SmilCssSvgMvpWidget.asset(assetPath: 'assets/images/nature.svg', width: 300, height: 200)),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(tester.takeException(), isNull);
    expect(find.byType(SmilCssSvgMvpWidget), findsOneWidget);
  });
}
