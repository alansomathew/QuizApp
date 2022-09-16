import 'package:flutter/material.dart';
import 'package:my_first_app/quiz.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourate color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourate animal?',
      'answers': [
        {'text': 'Lion', 'score': 5},
        {'text': 'Dog', 'score': 1},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Cat', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourate fruit?',
      'answers': [
        {'text': 'Mango', 'score': 10},
        {'text': 'Oranage', 'score': 5},
        {'text': 'Apple', 'score': 1},
        {'text': 'Guava', 'score': 3}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_totalScore);
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("More questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QuiZ '),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
