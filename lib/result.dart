import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhase {
    var resultText;
    if (resultScore <= 10) {
      resultText = 'You are Good!';
    } else if (resultScore <= 20) {
      resultText = 'You are Pretty Likable!';
    } else if (resultScore <= 25) {
      resultText = 'You are ... Starnge!';
    } else {
      resultText = 'You are so Bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: resetHandler,
            child: Text(
              'ReStart Quiz!',
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.green,
              side: BorderSide(color: Colors.blue),
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
