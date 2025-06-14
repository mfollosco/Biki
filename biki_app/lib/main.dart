import 'package:BiKi/drag-game2/game2.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/analytics.dart';
import 'pages/activity_screen.dart';
import 'flashcards/flashcards.dart';
import 'pages/comparison/comparison.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/analytics': (context) => AnalyticsScreen(),
        '/activity': (context) => ActivityScreen(),
        '/flashcards': (context) => Flashcards(),
        '/game1': (context) => Comparison(),
        '/game2': (context) => DragGame2(),
      },
    );
  }
}