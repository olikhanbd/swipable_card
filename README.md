# SwipeCards Flutter Package

![CI](https://github.com/olikhanbd/swipable_card/actions/workflows/flutter.yml/badge.svg)
[![Coverage](https://codecov.io/gh/olikhanbd/swipable_card/branch/main/graph/badge.svg)](https://codecov.io/gh/olikhanbd/swipable_card)

swipable_card is a Flutter package that makes it easy to implement swipeable card layouts, inspired by Tinder-style gestures. With smooth animations, intuitive gestures, and flexible customization, you can create engaging swipe interactions for dating apps, product showcases, quizzes, or any card-based UI.

# SwipeCards Demo

<div style="display: flex; justify-content: space-around; align-items: center;">

  <!-- First GIF -->
  <div style="text-align: center;">
    <img src="example/assets/loop.gif" width="200" />
    <div><strong>Loop</strong></div>
  </div>

  <!-- Second GIF -->
  <div style="text-align: center;">
    <img src="example/assets/without_loop.gif" width="200" />
    <div><strong>Without Loop</strong></div>
  </div>

</div>

## Features

🚀 Tinder-like card swiping (left, right, up, down)

🎨 Customizable card widgets (images, text, or any widget)

🎬 Built-in animations for smooth card transitions

🧩 Callback support (detect swipe direction, card index, end of deck, etc.)

🔄 Stacked card layout with configurable number of visible cards

⚡ Lightweight and easy to integrate

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


