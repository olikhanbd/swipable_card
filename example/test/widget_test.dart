import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipable_card_example/main.dart'; // adjust if your example app has a different package name

void main() {
  testWidgets('SwipeCards shows cards and responds to gestures',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;

    // Build the app
    await tester.pumpWidget(MyApp());

    // Verify the first card 🍎 is visible
    expect(find.text("🍎"), findsOneWidget);

    // Simulate dragging left (swipe left)
    await tester.drag(find.text("🍎"), const Offset(-300, 0));
    await tester.pumpAndSettle();

    // Verify the next card 🍌 is visible
    expect(find.text("🍌"), findsOneWidget);
  });

  testWidgets('Swipe buttons trigger swipes', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // First card should be 🍎
    expect(find.text("🍎"), findsOneWidget);

    // Tap the "thumb_down" button (left swipe)
    await tester.tap(find.byIcon(Icons.thumb_down));
    await tester.pumpAndSettle();

    // Next card 🍌 should appear
    expect(find.text("🍌"), findsOneWidget);

    // Tap the "thumb_up" button (right swipe)
    await tester.tap(find.byIcon(Icons.thumb_up));
    await tester.pumpAndSettle();

    // Next card 🍇 should appear
    expect(find.text("🍇"), findsOneWidget);
  });
}
