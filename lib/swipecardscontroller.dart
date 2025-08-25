/// A controller that provides callbacks for swipe directions.
///
/// Use this to handle swipe gestures (left, right, up, down) in
/// your swipe card widget.
class SwipeCardsController<T> {
  /// Called when a card is swiped left.
  void Function()? swipeLeft;

  /// Called when a card is swiped right.
  void Function()? swipeRight;

  /// Called when a card is swiped up.
  void Function()? swipeUp;

  /// Called when a card is swiped down.
  void Function()? swipeDown;
}
