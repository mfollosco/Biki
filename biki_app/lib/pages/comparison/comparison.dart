import 'package:flutter/material.dart';
import 'dart:math';
import 'comp_qlist.dart';
import 'comp_qclass.dart';
import 'package:flutter_tts/flutter_tts.dart';

//import 'package:flutter/material.dart';

class Comparison extends StatefulWidget{
  @override
  _ComparisonState createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison>{
  late List<Question> shuffledQs;
  int currentQIndex = 0;
  late Question currentQ;
  String? leftDropped;
  String? rightDropped;
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState(){
    super.initState();
    shuffledQs = List<Question>.from(questions)..shuffle();
    currentQ = questions[Random().nextInt(questions.length)];
    flutterTts.setSpeechRate(0.6);
    flutterTts.setPitch(1.0);
  }

  void speakQ(String language) async{
    //String tts = "";
    if (language == "spanish"){
      //tts = currentQ.spanishQ;
      flutterTts.setLanguage("es-ES");
      flutterTts.setVoice({"name": "Monica", "locale": "es-ES"});
      List<String> partsS = [];

      if (leftDropped == currentQ.leftAnswer){
        partsS.add(currentQ.leftSpanish);
      }
      else if (leftDropped == currentQ.rightAnswer){
        partsS.add(currentQ.rightSpanish);
      }

      partsS.add(currentQ.spanishQ);

      if (rightDropped == currentQ.leftAnswer){
        partsS.add(currentQ.leftSpanish);
      }
      else if(rightDropped == currentQ.rightAnswer){
        partsS.add(currentQ.rightSpanish);
      }

      String fullPhrase = partsS.join(' ');
      await flutterTts.speak(fullPhrase);
    }

    else if (language == "english"){
      //tts = currentQ.englishQ;
      flutterTts.setLanguage("en-US");
      flutterTts.setVoice({"name": "Samantha", "locale": "en-US"});
      List<String> partsE = [];

      if(leftDropped == currentQ.leftAnswer){
        partsE.add(currentQ.leftEnglish);
      }
      else if(leftDropped == currentQ.rightAnswer){
        partsE.add(currentQ.rightEnglish);
      }

      partsE.add(currentQ.englishQ);

      if(rightDropped == currentQ.leftAnswer){
        partsE.add(currentQ.leftEnglish);
      }
      else if(rightDropped == currentQ.rightAnswer){
        partsE.add(currentQ.rightEnglish);
      }

      String fullPhrase = partsE.join(' ');
      await flutterTts.speak(fullPhrase);
    }
  }

  bool get isAnswerCorrect {
    return leftDropped == currentQ.leftAnswer &&
           rightDropped == currentQ.rightAnswer;
  }

  void nextQuestion(){
    setState((){
      currentQIndex++;
      if (currentQIndex >= shuffledQs.length){
        shuffledQs.shuffle();
        currentQIndex = 0;
      }
      currentQ = shuffledQs[currentQIndex];
      leftDropped = null;
      rightDropped = null;
    });
  }

  void checkAnswer(){
    if (leftDropped != null && rightDropped != null){
      if (isAnswerCorrect){
        nextQuestion();
      }
      else{
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 88, 157, 230),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (currentQ.contextImage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          currentQ.contextImage!,
                          width: 250,
                          height: 250,
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: currentQ.draggableImages.map((imgPath){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Draggable<String>(
                            data: imgPath,
                            child: Image.asset(
                              imgPath,
                              width: 150,
                              height: 150,
                            ),
                            feedback: Image.asset(
                              imgPath,
                              width: 150,
                              height: 150,
                            ),
                            childWhenDragging: Container(),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 5),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DragTarget<String>(
                          onAcceptWithDetails: (details){
                            setState((){
                              final newDropped = details.data;
                              if (rightDropped == newDropped){
                                rightDropped = null;
                              }
                              leftDropped = newDropped;
                            });
                          },
                          builder: (context, candidateData, rejectedData){
                            return Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color:  Color.fromARGB(255, 174, 233, 177),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: leftDropped != null
                                ? Draggable<String>(
                                  data: leftDropped!,
                                  feedback: Image.asset(leftDropped!, width: 100, height: 100),
                                  childWhenDragging: Container(),
                                  onDragCompleted: () {
                                    setState((){
                                      leftDropped = null;
                                    });
                                  },
                                  child: Image.asset(leftDropped!, width: 100, height: 100),
                                )
                                : null,
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        Image.asset(
                          currentQ.question,
                          width: 400,
                          height: 200,
                        ),
                        SizedBox(width: 20),
                        DragTarget<String>(
                          onAcceptWithDetails: (details) {
                            setState((){
                              final newDropped = details.data;
                              if (leftDropped == newDropped){
                                leftDropped = null;
                              }
                              rightDropped = newDropped;
                            });
                          },
                          builder: (context, candidateData, rejectedData){
                            return Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 174, 233, 177),
                                border:Border.all(color: Colors.grey),
                              ),
                              child: rightDropped != null
                                ? Draggable<String>(
                                  data: rightDropped!,
                                  feedback: Image.asset(rightDropped!, width: 100, height: 100),
                                  childWhenDragging: Container(),
                                  onDragCompleted: (){
                                    setState((){
                                      rightDropped = null;
                                    });
                                  },
                                  child: Image.asset(rightDropped!, width: 100, height: 100),
                                )
                                : null,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: (){
                    checkAnswer();
                  },
                  child: Image.asset(
                    'assets/images/SubmitButton.png',
                    width: 100,
                    height: 60,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        speakQ("spanish");
                      },
                      child: Image.asset(
                        'assets/images/SpanishOption.png',
                        width: 90,
                        height: 90,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: (){
                        speakQ("english");
                      },
                      child: Image.asset(
                        'assets/images/EnglishOption.png',
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


