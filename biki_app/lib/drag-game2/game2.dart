import 'dart:io';

import 'package:flutter/material.dart';
import 'question_class.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'questions_list.dart';
import 'question_widget.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';

const String url = 'https://api.ttsmp3.com/v1/';

FlutterTts flutterTts = FlutterTts();
enum TtsState { playing, stopped }

class DragGame2 extends StatefulWidget {
  @override
  _DragGame2State createState() => _DragGame2State();
}

class _DragGame2State extends State<DragGame2> {
  late Question currentQuestion;
  TtsState ttsState = TtsState.stopped;
  String? draggedAnswer; // Variable to store the dragged answer

  @override
  void initState() {
    super.initState();
    _pickRandomQuestion();
    flutterTts.setLanguage("en-US");
  }

  void _pickRandomQuestion() {
    setState(() {
      currentQuestion = questions[Random().nextInt(questions.length)];
      draggedAnswer = null; // Reset the dragged answer for the new question
    });
  }

  // Future<string> getEnAudio(string text){
  //   final res = await http.post(Uri.parse(url));
  //   final json = jsonDecode(res.body);
  //   if (json['Error'] != 0){
  //     print("error");
  //   }
  //   else{

  //   }
  // }

  Future _speak(String text) async {
    await flutterTts.stop();
    var result = await flutterTts.speak(text);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag Game 2")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            child: Image.asset(currentQuestion.main_img),
          ),
          SizedBox(height: 30),

          // DRAGGABLE ANSWER OPTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _speak(currentQuestion.wrong_txt);
                },
                child: Draggable<List>(
                  data: [currentQuestion.wrong_txt, currentQuestion.wrong_img],
                  feedback: Container(
                    height: 200,
                    width:400,
                    child: Image.asset(currentQuestion.wrong_img),
                  ),
                  child: Container(
                    height: 200,
                    width:400,
                    child: Image.asset(currentQuestion.wrong_img, height: 100, width: 200),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  _speak(currentQuestion.answer_txt);
                },
                child: Draggable<List>(
                  data: [currentQuestion.answer_txt, currentQuestion.answer_img],
                  feedback: Container(
                    height: 200,
                    width: 400,
                    child: Image.asset(currentQuestion.answer_img),
                  ),
                  child: Container(
                    height: 200,
                    width: 400,
                    child: Image.asset(currentQuestion.answer_img, height: 100, width: 200),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          // DRAG TARGET
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(currentQuestion.img1, height: 100, width: 200),
                DragTarget<List>(
                  builder: (context, candidateData, rejectedData) {
                    return draggedAnswer != null
                    ? Container(
                      height: 80,
                      width: 250,
                      color: Colors.blue[100],
                      child: Center(
                        child: Image.asset(draggedAnswer!, height:100, width:200)
                      ),
                    )
                    : Container(
                      height: 80,
                      width: 250,
                      color: Colors.blue[100],
                    );
                  },
                  onAcceptWithDetails: (receivedAnswer) async {
                    setState(() {
                      draggedAnswer = receivedAnswer.data[1]; // Store the dragged answer
                    });
                    print(receivedAnswer.data);
                    await _speak(currentQuestion.question_pt1);
                    await Future.delayed(Duration(milliseconds: 1500)); // 500ms pause
                    await _speak(receivedAnswer.data[0]);
                    await Future.delayed(Duration(milliseconds: 1500)); // 500ms pause
                    await _speak(currentQuestion.question_pt2);
                  },
                ),
                Image.asset(currentQuestion.img2, height: 100, width: 200),
              ],
            ),
          ),

          SizedBox(height: 50),

          // SUBMIT BUTTON
          ElevatedButton(
            onPressed: () {
              if (draggedAnswer == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please drag an answer to the target before submitting!")),
                );
              } else {
                bool isCorrect = draggedAnswer == currentQuestion.answer_img;
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(isCorrect ? "Correct!" : "Try Again"),
                    actions: [
                      TextButton(
                        child: Text("Next"),
                        onPressed: () {
                          Navigator.pop(context);
                          _pickRandomQuestion();
                        },
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text("Submit"),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Repeat Button
              Column(
                children: [
                    GestureDetector(
                    onTap: () {
                      _speak("The butterfly is blank the wheelbarrow");
                    },
                    child: Image.asset('assets/images/SpanishOption.png', height: 100, width: 200)
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _speak("The butterfly is blank the wheelbarrow");
                    },
                    child: Image.asset('assets/images/EnglishOption.png', height: 100, width: 200)
                  ),                
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}