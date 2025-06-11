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
              Draggable<String>(
                data: currentQuestion.wrong_ans,
                feedback: Material(
                  child: Text(currentQuestion.wrong_ans, style: TextStyle(fontSize: 18, color: Colors.blue)),
                ),
                child: Text(currentQuestion.wrong_ans, style: TextStyle(fontSize: 18)),
              ),
              SizedBox(width: 20),
              Draggable<String>(
                data: currentQuestion.answer,
                feedback: Material(
                  child: Text(currentQuestion.answer, style: TextStyle(fontSize: 18, color: Colors.blue)),
                ),
                child: Text(currentQuestion.answer, style: TextStyle(fontSize: 18)),
              ),
            ],
          ),

          SizedBox(height: 50),

          // DRAG TARGET
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(currentQuestion.question_pt1),
                DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      height: 80,
                      width: 200,
                      color: Colors.blue[100],
                      child: Center(
                        child: Text(
                          draggedAnswer ?? "Drop Answer Here",
                          style: TextStyle(
                            color: draggedAnswer != null ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                  onAccept: (receivedAnswer) async {
                    setState(() {
                      draggedAnswer = receivedAnswer; // Store the dragged answer
                    });
                    print(receivedAnswer);
                    await _speak(currentQuestion.question_pt1);
                    await Future.delayed(Duration(milliseconds: 1500)); // 500ms pause
                    await _speak(receivedAnswer);
                    await Future.delayed(Duration(milliseconds: 1500)); // 500ms pause
                    await _speak(currentQuestion.question_pt2);
                  },
                ),
                Text(currentQuestion.question_pt2),
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
                bool isCorrect = draggedAnswer == currentQuestion.answer;
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
                  IconButton(onPressed: () => _speak("The butterfly is blank the wheelbarrow"), icon: const Icon(Icons.speaker)),
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () => _speak("The butterfly is blank the wheelbarrow"), icon: const Icon(Icons.refresh)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}