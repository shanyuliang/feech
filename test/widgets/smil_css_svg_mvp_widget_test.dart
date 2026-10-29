import 'dart:io';

import 'package:feech/feech.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:xml/xml.dart';

void main() {
  testWidgets('nature bee moves on consecutive frames and repeats its flight', (tester) async {
    final svg = File('assets/images/nature.svg').readAsStringSync();
    await tester.pumpWidget(
      MaterialApp(
        home: SmilCssSvgMvpWidget.string(svgXml: svg, width: 300, height: 200),
      ),
    );
    await tester.pump();

    String beeTransform() {
      final picture = tester.widget<SvgPicture>(find.byType(SvgPicture));
      final loader = picture.bytesLoader as SvgStringLoader;
      final document = XmlDocument.parse(loader.provideSvg(null));
      return document.descendants
          .whereType<XmlElement>()
          .singleWhere((element) => element.getAttribute('id') == 'eSfF1urTRx053_to')
          .getAttribute('transform')!;
    }

    final positions = <String>[];
    for (var i = 0; i < 60; i++) {
      await tester.pump(const Duration(microseconds: 16667));
      positions.add(beeTransform());
    }
    expect(positions.toSet().length, 60, reason: 'Motion distance must interpolate on every 60 Hz frame.');
    await tester.pump(const Duration(seconds: 3));
    expect(beeTransform(), positions.last, reason: 'The same position must recur one flight cycle later.');
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
