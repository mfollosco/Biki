import 'package:flutter/material.dart';
import 'dart:math' as math;

// import 'package:screens/card.dart';
// import 'package:flip_card/flip_card.dart';

class Flashcards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();

  const Flashcards({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Card',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const CardFlipAnimation(),
    );
  }
}

class CardFlipAnimation extends StatefulWidget {
  const CardFlipAnimation({super.key});

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<Flashcards> {
  int _currentIndex = 0;
  final List<String> _flashcards = [
    "Flashcard 1",
    "Flashcard 2",
    "Flashcard 3",
    "Flashcard 4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flashcards"),
      ),
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Card(
                  child: Center(
                    child: Text(_flashcards[_currentIndex]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: showPreviousCard, child: Text("prev")),
                  SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: showNextCard,
                    child: Text("next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
