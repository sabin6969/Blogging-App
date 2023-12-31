import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Widget> pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.pink,
      child: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Builder(
        builder: (context) {
          return LiquidSwipe(
            pages: pages,
            positionSlideIcon: 0.5,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
            ),
            enableLoop: false,
          );
        },
      ),
    );
  }
}
