import 'dart:io';

import 'package:feech/feech.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:xml/xml.dart';

void main() {
  testWidgets('nature bee and white lines move on consecutive frames and repeat', (tester) async {
    final svg = File('assets/images/nature.svg').readAsStringSync();
    await tester.pumpWidget(
      MaterialApp(
        home: SmilCssSvgMvpWidget.string(svgXml: svg, width: 300, height: 200),
      ),
    );
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
        home: Scaffold(
          body: SmilCssSvgMvpWidget.asset(
            assetPath: 'assets/images/nature.svg',
            width: 300,
            height: 200,
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(tester.takeException(), isNull);
    expect(find.byType(SmilCssSvgMvpWidget), findsOneWidget);
  });
}
