import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/analytics.dart';
import 'pages/activity_screen.dart';
import 'flashcards/flashcards.dart';

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
      },
    );
  }
}