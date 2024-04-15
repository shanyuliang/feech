import 'package:feech/feech.dart';
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
}
