//import 'dart:io';
//import 'package:flutter/material.dart';
import 'comp_qclass.dart';

final List <Question> questions = [
  Question(
    question: 'assets/images/vocab_more.png',
    spanishQ: 'es más que',
    englishQ: 'is more than',
    leftAnswer: 'assets/images/bouquet.png',
    rightAnswer: 'assets/images/flower1.png',
    leftSpanish: 'el ramo',
    rightSpanish: 'la flor',
    leftEnglish: 'the bouquet',
    rightEnglish: 'the flower',
    draggableImages: [
      'assets/images/flower1.png',
      'assets/images/bouquet.png',
    ],
  ),

  Question(
    question: 'assets/images/vocab_heavier.png',
    spanishQ: 'pesa más que',
    englishQ: 'is heavier than',
    leftAnswer: 'assets/images/rock.png',
    rightAnswer: 'assets/images/ladybug.png',
    leftSpanish: 'la roca',
    rightSpanish: 'la mariquita',
    leftEnglish: 'the rock',
    rightEnglish: 'the ladybug',
    draggableImages: [
      'assets/images/rock.png',
      'assets/images/ladybug.png',
    ],
  ),

  Question(
    question: 'assets/images/vocab_longer.png',
    spanishQ: 'es más largo que',
    englishQ: 'is longer than',
    leftAnswer: 'assets/images/caterpillar.png',
    rightAnswer: 'assets/images/snail.png',
    leftSpanish: 'la oruga',
    rightSpanish: 'el caracol',
    leftEnglish: 'the caterpillar',
    rightEnglish: 'the snail',
    draggableImages: [
      'assets/images/caterpillar.png',
      'assets/images/snail.png',
    ],
  ),
/*
  Question(
    question: 'assets/images/vocab_under.png',
    spanishQ: 'está debajo de',
    englishQ: 'is under',
    leftAnswer: 'assets/images/flower1.png',
    rightAnswer: 'assets/images/ladybug.png',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),
*/
  Question(
    question: 'assets/images/vocab_smaller.png',
    spanishQ: 'es más pequeño que',
    englishQ: 'is smaller than',
    leftAnswer: 'assets/images/ladybug.png',
    rightAnswer: 'assets/images/butterfly.png',
    leftSpanish: 'la mariquita',
    rightSpanish: 'la mariposa',
    leftEnglish: 'the ladybug',
    rightEnglish: 'the butterfly',
    contextImage: 'assets/images/contextBigger.png',
    draggableImages: [
      'assets/images/butterfly.png',
      'assets/images/ladybug.png',
    ],
  ),
/*
  Question(
    question: 'assets/images/vocab_shorter.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),  

  Question(
    question: 'assets/images/vocab_same.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_right.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_outside.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_near.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_lighter.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_less.png',
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_left.png',
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_inside.png',
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),
*/
  Question(
    question: 'assets/images/vocab_infront.png',
    spanishQ: 'está en frente de',
    englishQ: 'is in front of',
    leftAnswer: 'assets/images/snail.png',
    rightAnswer: 'assets/images/butterfly.png',
    leftSpanish: 'el caracol',
    rightSpanish: 'la mariposa',
    leftEnglish: 'the snail',
    rightEnglish: 'the butterfly',
    contextImage: 'assets/images/contextBehind.png',
    draggableImages: [
      'assets/images/butterfly.png',
      'assets/images/snail.png',
    ],
  ),
/*
  Question(
    question: 'assets/images/vocab_far.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),

  Question(
    question: 'assets/images/vocab_close.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),
*/
  Question(
    question: 'assets/images/vocab_bigger.png',
    spanishQ: 'es más grande de',
    englishQ: 'is bigger than',
    leftAnswer: 'assets/images/butterfly.png',
    rightAnswer: 'assets/images/ladybug.png',
    leftSpanish: 'la mariposa',
    rightSpanish: 'la mariquita',
    leftEnglish: 'the butterfly',
    rightEnglish: 'the ladybug',
    contextImage: 'assets/images/contextBigger.png', 
    draggableImages: [
      'assets/images/ladybug.png',
      'assets/images/butterfly.png',
    ],
  ),
/*
  Question(
    question: 'assets/images/vocab_below.png'
    spanishQ: 
    englishQ: 
    leftAnswer: 'assets/images/',
    rightAnswer: 'assets/images/',
    leftSpanish: 
    rightSpanish: 
    leftEnglish: 
    rightEnglish: 
    draggableImages: [
    ],
  ),
*/
  Question(
    question: 'assets/images/vocab_above.png',
    spanishQ: 'está arriba de',
    englishQ: 'is above',
    leftAnswer: 'assets/images/ladybug.png',
    rightAnswer: 'assets/images/flower1.png',
    leftSpanish: 'la mariquita',
    rightSpanish: 'la flor',
    leftEnglish: 'the ladybug',
    rightEnglish: 'the flower',
    contextImage: 'assets/images/contextAbove.png',
    draggableImages: [
      'assets/images/flower1.png',
      'assets/images/ladybug.png',
    ],
  ),

  Question(
    question: 'assets/images/vocab_taller.png',
    spanishQ: 'es más alto que',
    englishQ: 'is taller than',
    leftAnswer: 'assets/images/tall_flower.png',
    rightAnswer: 'assets/images/short_flower.png',
    leftSpanish: 'la flor rosada',
    rightSpanish: 'la flor morada',
    leftEnglish: 'the pink flower',
    rightEnglish: 'the purple flower',
    draggableImages: [
      'assets/images/short_flower.png',
      'assets/images/tall_flower.png',
    ],
  ),

];