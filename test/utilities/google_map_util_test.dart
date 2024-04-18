import 'package:feech/feech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('getBitmapDescriptorFromSVGAsset', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
    await tester.pumpAndSettle();
    final BuildContext context = tester.element(find.byType(Container));

    await tester.runAsync(
      () async {
        await getBitmapDescriptorFromSVGAsset(
          context: context,
          assetName: "assets/images/pin_drinking_fountain.svg",
          targetSpWidth: 48,
          enableDebugLog: true,
        );
      },
    );
  });
}
