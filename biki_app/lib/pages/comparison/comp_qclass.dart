//import 'dart:io';

class Question {
  final String question;
  final String spanishQ;
  final String englishQ;
  final String leftAnswer;
  final String rightAnswer;
  final String leftSpanish;
  final String rightSpanish;
  final String leftEnglish;
  final String rightEnglish;
  final String? contextImage;
  final List<String> draggableImages;

  Question({
    required this.question,
    required this.spanishQ,
    required this.englishQ,
    required this.leftAnswer,
    required this.rightAnswer,
    required this.leftSpanish,
    required this.rightSpanish,
    required this.leftEnglish,
    required this.rightEnglish,
    this.contextImage,
    required this.draggableImages,
  });
}