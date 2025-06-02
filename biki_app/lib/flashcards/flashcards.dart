import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

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
  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  int _currentIndex = 0;
  bool _isEnglish = true; // Change this to switch between languages
  // final List<String> _flashcards = [
  //   "Above. Under",
  //   "Outside. Inside",
  //   "Many. Few",
  //   "Less. More"
  // ];

  // final List<String> _images = [
  //   "assets/images/comparisons-01.png",
  //   'assets/images/comparisons-02.png',
  //   'assets/images/comparisons-03.png',
  //   'assets/images/comparisons-04.png',
  //   "assets/images/comparisons-05.png",
  //   "assets/images/comparisons-06.png"
  // ];
  final List<Map<String, String>> _flashcards = [
    {
      "vocab": "Above. Under",
      "image": "assets/images/comparisons-01.png",
    },
    {
      "vocab": "Outside. Inside",
      "image": "assets/images/comparisons-02.png",
    },
    {
      "vocab": "Many. Few",
      "image": "assets/images/comparisons-03.png",
    },
    {
      "vocab": "Less. More",
      "image": "assets/images/comparisons-04.png",
    },
    {
      "vocab": "Small. Big",
      "image": "assets/images/comparisons-05.png",
    },
    {
      "vocab": "Long. Short",
      "image": "assets/images/comparisons-06.png",
    },
  ];


  @override
  void initState() {
    super.initState();
    _speakWord(_flashcards[_currentIndex]['vocab']!);
  }

  void _speakWord(String text) async {
    if (!_isEnglish) {
    // Speak the translated word in Spanish
      try {
        var translation = await translator.translate(text, to: 'es');
        String translatedText = translation.text;
        await flutterTts.setLanguage("es-ES");
        await flutterTts.setPitch(1);
        await flutterTts.setSpeechRate(0.3);
        await flutterTts.speak(translatedText);
      } catch (e) {
        print("Error during translation: $e");
      }
    return;
  }

  // Speak the word in English
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.setSpeechRate(0.3);
  await flutterTts.speak(text);
  }

  Future<void> _speakTranslatedWord(String text, String targetLanguage) async {
    try {
      // Translate the text to the target language
      var translation = await translator.translate(text, to: targetLanguage);
      String translatedText = translation.text;
      // Speak the translated text
      await flutterTts.setLanguage(targetLanguage == 'es' ? "es-ES" : "en-US");
      await flutterTts.setPitch(1);
      await flutterTts.setSpeechRate(0.3);
      await flutterTts.speak(translatedText);
    } catch (e) {
      print("Error during translation or speech: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Move this OUTSIDE the widget tree
    final vocabParts = _flashcards[_currentIndex]['vocab']!.split('. ');

    // Build the list of audio buttons
    List<Widget> audioButtons;
    if (vocabParts.length == 2) {
      audioButtons = [
        IconButton(
          icon: Image.asset('assets/components/repeat.png'),
          onPressed: () => _speakWord(vocabParts[0]),
        ),
        IconButton(
          icon: Image.asset('assets/components/repeat.png'),
          onPressed: () => _speakWord(vocabParts[1]),
        ),
      ];
    } else {
      audioButtons = [
        IconButton(
          icon: Image.asset('assets/components/repeat.png'),
          onPressed: () => _speakWord(_flashcards[_currentIndex]['vocab']!),
        ),
      ];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flashcards"),
      ),
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                height: 500,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          _flashcards[_currentIndex]['image']!,
                          fit: BoxFit.cover, // Ensures the image fills the box
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _flashcards[_currentIndex]['vocab']!,
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: showPreviousCard, child: const Text("prev")),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: showNextCard,
                    child: const Text("next"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/components/repeat.png'),
                    onPressed: () => _speakWord(_flashcards[_currentIndex]['vocab']!),
                  ),
                  IconButton(
                    icon: Image.asset('assets/components/Translate.png'),
                    onPressed: () {
                      setState(() {
                        _isEnglish = !_isEnglish; // Toggle the language state
                      });
                    },
                  )
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
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
      // (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
    _speakWord(_flashcards[_currentIndex]['vocab']!);
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _flashcards.length) % _flashcards.length;
      // (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
    _speakWord(_flashcards[_currentIndex]['vocab']!);
  }
}
