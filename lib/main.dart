import 'package:flutter/material.dart';
import 'package:quiz_app_2/result.dart';
import './question.dart';
import './answer.dart';
import 'quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      "questionText": "What's your favorite colour?",
      "answer": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 8},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {"text": "Dog", "score": 10},
        {"text": "Rabbit", "score": 8},
        {"text": "Lion", "score": 15},
        {"text": "Snake", "score": 3}
      ],
    },
    {
      "questionText": "What's your favorite place?",
      "answer": [
        {"text": "Goa", "score": 10},
        {"text": "Simla", "score": 12},
        {"text": "Delhi", "score": 8},
        {"text": "Kashmir", "score": 5}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: () => _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
