import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
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
