import 'dart:io';

//need to include Spanish words associated with each question
class Question {
  final String question_pt1;
  final String question_pt2;
  final String answer;
  final String main_img;
  final String wrong_ans;
  final String img1;
  final String img2;
  final String whole_ans;

  Question({
    required this.question_pt1,
    required this. question_pt2, 
    required this.answer, 
    required this.main_img,
    required this.wrong_ans,
    required this.img1,
    required this.img2,
    required this.whole_ans
  });
}