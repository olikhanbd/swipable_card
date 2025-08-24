import 'package:flutter_test/flutter_test.dart';
import 'package:swipable_card/swipecardscontroller.dart';

void main() {
  test('SwipeCardsController exposes swipe functions', () {
    final controller = SwipeCardsController<String>();

    // Initially functions should be null
    expect(controller.swipeLeft, isNull);

    // Later your widget sets these — you can write integration tests
    // to verify they get wired up properly
  });
}
