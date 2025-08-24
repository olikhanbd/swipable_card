# SwipeCards Flutter Package

![CI](https://github.com/olikhanbd/swipable_card/actions/workflows/flutter.yml/badge.svg)
[![Coverage](https://codecov.io/gh/olikhanbd/swipable_card/branch/main/graph/badge.svg?token=97764297-c21a-4f55-a180-52816b31ffd0)](https://codecov.io/gh/olikhanbd/swipable_card)

swipable_card is a Flutter package that makes it easy to implement swipeable card layouts, inspired by Tinder-style gestures. With smooth animations, intuitive gestures, and flexible customization, you can create engaging swipe interactions for dating apps, product showcases, quizzes, or any card-based UI.

## Features
<list>
<li>🚀 Tinder-like card swiping (left, right, up, down)</li>

<li>🎨 Customizable card widgets (images, text, or any widget)</li>

<li>🎬 Built-in animations for smooth card transitions</li>

<li>🧩 Callback support (detect swipe direction, card index, end of deck, etc.)</li>

<li>🔄 Stacked card layout with configurable number of visible cards</li>

<li>⚡ Lightweight and easy to integrate</li>
</list>

# SwipeCards Demo

| Loop | Without Loop |
|------|--------------|
| <img src="example/assets/loop.gif" width="250"/> | <img src="example/assets/without_loop.gif" width="250"/> |

## Example

Check the [example](example/lib/main.dart) for a full demo app.

```dart
SwipeCards<String>(
	controller: controller,
	items: ["🍎", "🍌", "🍇", "🍓", "🍍"],
	cardBuilder: (item) => CardContent(item: item),
	loop: true,
	onSwipeLeft: (item) {
	  print("Swiped Left: $item");
	},
	onSwipeRight: (item) {
	  print("Swiped Right: $item");
	},
	onSwipeUp: (item) {
	  print("Swiped Up: $item");
	},
	onSwipeDown: (item) {
	  print("Swiped Down: $item");
	},
)


