import 'package:flutter/material.dart';
import 'package:swipable_card/swipecards.dart';
import 'package:swipable_card/swipecardscontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SwipeCardsController<String> controller =
      SwipeCardsController<String>();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Swipe Cards with Buttons")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.swipeDown?.call(),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.yellow, // changed from primary
                    ),
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () => controller.swipeLeft?.call(),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.red, // changed from primary
                    ),
                    child: Icon(Icons.thumb_down, color: Colors.white),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () => controller.swipeRight?.call(),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor:
                          Colors.lightGreen, // changed from primary
                    ),
                    child: Icon(Icons.thumb_up, color: Colors.white),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () => controller.swipeUp?.call(),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green, // changed from primary
                    ),
                    child: Icon(Icons.favorite, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ Card Content Widget ------------------
class CardContent extends StatelessWidget {
  final String item;
  const CardContent({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: Container(
          width: 300,
          height: 400,
          alignment: Alignment.center,
          child: Text(item, style: TextStyle(fontSize: 80)),
        ),
      ),
    );
  }
}
