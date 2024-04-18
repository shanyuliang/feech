import 'package:feech/feech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('debounceWarmUp', () async {
    int i = 1;
    action() {
      i++;
    }

    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceWarmUp(actionId: "Increase I warm up", durationInMilliseconds: 500); // Called

    await Future.delayed(const Duration(milliseconds: 600));
    expect(i, 2);
  });

  test('debounceCoolDown', () async {
    int i = 1;
    action() {
      i++;
    }

    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500); // Called
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500); // Called
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);
    await Future.delayed(const Duration(milliseconds: 100));
    action.debounceCoolDown(actionId: "Increase I cool down", durationInMilliseconds: 500);

    await Future.delayed(const Duration(milliseconds: 600));
    expect(i, 3);
  });
}
