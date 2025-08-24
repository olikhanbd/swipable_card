import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swipable_card/swipecardscontroller.dart';

// ignore_for_file: library_private_types_in_public_api

class SwipeCards<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(T item) cardBuilder;
  final bool loop;
  final Function(T item)? onSwipeLeft;
  final Function(T item)? onSwipeRight;
  final Function(T item)? onSwipeUp;
  final Function(T item)? onSwipeDown;
  final SwipeCardsController<T>? controller;

  const SwipeCards({
    required this.items,
    required this.cardBuilder,
    this.loop = false,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeUp,
    this.onSwipeDown,
    this.controller,
    super.key,
  });

  @override
  _SwipeCardsState<T> createState() => _SwipeCardsState<T>();
}

class _SwipeCardsState<T> extends State<SwipeCards<T>> {
  late List<T> cards;
  double xOffset = 0.0;
  double yOffset = 0.0;
  double rotation = 0.0;

  double maxScale = 1.05;
  double bottomCardBaseScale = 1.0;
  double bottomCardScale = 1.0;
  double bottomCardYOffset = -10;
  double currentYOffset = -10;

  @override
  void initState() {
    super.initState();
    cards = List.from(widget.items.reversed);

    if (widget.controller != null) {
      widget.controller!.swipeLeft = () => swipeCard("left");
      widget.controller!.swipeRight = () => swipeCard("right");
      widget.controller!.swipeUp = () => swipeCard("up");
      widget.controller!.swipeDown = () => swipeCard("down");
    }
  }

  void resetPosition() {
    setState(() {
      xOffset = 0.0;
      yOffset = 0.0;
      rotation = 0.0;
      bottomCardScale = bottomCardBaseScale;
      currentYOffset = bottomCardYOffset;
    });
  }

  void updateBottomCard() {
    double dragDistance = min(xOffset.abs(), 150);
    double progress = dragDistance / 150; // 0.0 → 1.0

    double scaleIncrement = (maxScale - bottomCardBaseScale) * progress;
    double yOffsetIncrement = (0 - bottomCardYOffset) * progress;

    setState(() {
      bottomCardScale = bottomCardBaseScale + scaleIncrement;
      currentYOffset = bottomCardYOffset + yOffsetIncrement;
    });
  }

  void swipeCard(String direction) {
    if (cards.isEmpty) return;
    T topCard = cards.last;

    // Animate card off-screen
    setState(() {
      if (direction == "right") {
        xOffset = 500;
        rotation = 0.5;
      } else if (direction == "left") {
        xOffset = -500;
        rotation = -0.5;
      } else if (direction == "up") {
        yOffset = -500;
      } else if (direction == "down") {
        yOffset = 500;
      }
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        cards.removeLast();
        resetPosition();

        if (widget.loop) {
          cards.insert(0, topCard);
        }
      });

      switch (direction) {
        case "right":
          widget.onSwipeRight?.call(topCard);
          break;
        case "left":
          widget.onSwipeLeft?.call(topCard);
          break;
        case "up":
          widget.onSwipeUp?.call(topCard);
          break;
        case "down":
          widget.onSwipeDown?.call(topCard);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: cards.isEmpty
          ? Center(child: Container())
          : Stack(
              alignment: Alignment.center,
              children: cards.map((card) {
                int index = cards.indexOf(card);
                bool isTop = index == cards.length - 1;
                bool isSecond = index == cards.length - 2;

                return AnimatedContainer(
                  key: ValueKey(card),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  transform: Matrix4.identity()
                    ..translate(
                      isTop ? xOffset : 0.0,
                      isTop ? yOffset : currentYOffset,
                    )
                    ..rotateZ(isTop ? rotation : 0)
                    ..scale(
                      isTop
                          ? maxScale
                          : (isSecond ? bottomCardScale : bottomCardBaseScale),
                    ),
                  child: isTop
                      ? GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              xOffset += details.delta.dx;
                              yOffset += details.delta.dy;
                              rotation = xOffset / (size.width * 2);
                              updateBottomCard();
                            });
                          },
                          onPanEnd: (details) {
                            if (xOffset.abs() > 150) {
                              swipeCard(xOffset > 0 ? "right" : "left");
                            } else if (yOffset.abs() > 150) {
                              swipeCard(yOffset < 0 ? "up" : "down");
                            } else {
                              resetPosition();
                            }
                          },
                          child: widget.cardBuilder(card),
                        )
                      : widget.cardBuilder(card),
                );
              }).toList(),
            ),
    );
  }
}
