import 'package:feech/feech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('String.asNameGetInitials()', () {
    final initial = "Luke Shan".asNameGetInitials();
    expect(initial, "LS");
  });

  test('VoidCallback.debounceWarmUp()', () async {
    int i = 1;
    action() {
      i++;
    }

    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I delay", durationInMilliseconds: 500); // Called

    await Future.delayed(const Duration(milliseconds: 600));
    expect(i, 2);
  });

  test('VoidCallback.debounceCoolDown()', () async {
    int i = 1;
    action() {
      i++;
    }

    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500); // Called
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500); // Called
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I interval", durationInMilliseconds: 500);

    await Future.delayed(const Duration(milliseconds: 600));
    expect(i, 3);
  });

  test('randomString()', () {
    final r = randomString(9);
    expect(r.length, 9);
  });

  testWidgets('getBitmapDescriptorFromSVGAsset', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
    await tester.pumpAndSettle();
    final BuildContext context = tester.element(find.byType(Container));

    await tester.runAsync(() async {
      getBitmapDescriptorFromSVGAsset(
        context: context,
        assetName: "assets/images/pin_drinking_fountain.svg",
        targetSpWidth: 48,
        enableCache: true,
        enableDebugLog: true,
      );
    });
  });
}
