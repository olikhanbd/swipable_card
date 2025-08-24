import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipable_card/swipecards.dart';
import 'package:swipable_card/swipecardscontroller.dart';

void main() {
  testWidgets('SwipeCards renders first item', (WidgetTester tester) async {
    final controller = SwipeCardsController<String>();

    await tester.pumpWidget(
      MaterialApp(
        home: SwipeCards<String>(
          controller: controller,
          items: ["🍎", "🍌"],
          cardBuilder: (item) => Text(item),
        ),
      ),
    );

    // First card 🍎 should be visible
    expect(find.text("🍎"), findsOneWidget);
  });

  testWidgets('SwipeCards calls onSwipeRight', (WidgetTester tester) async {
    final controller = SwipeCardsController<String>();
    String? swipedItem;

    await tester.pumpWidget(
      MaterialApp(
        home: SwipeCards<String>(
          controller: controller,
          items: ["🍎"],
          cardBuilder: (item) => Text(item),
          onSwipeRight: (item) => swipedItem = item,
        ),
      ),
    );

    // Swipe right
    await tester.drag(find.text("🍎"), const Offset(300, 0));
    await tester.pumpAndSettle();

    expect(swipedItem, "🍎");
  });
}
