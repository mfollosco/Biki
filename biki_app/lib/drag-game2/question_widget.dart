import 'package:flutter/material.dart';
import 'question_class.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

        ],
      ),
    );
  }
}