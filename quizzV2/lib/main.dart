import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quizzBrain.dart';

QuizzBrain quizzBrain = QuizzBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final score = <Icon>[];

  int totalScore = 0;
  showAlert() {
    return Alert(
      context: context,
      style: AlertStyle(
          backgroundColor: Colors.white70,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationType: AnimationType.grow,
          animationDuration: Duration(milliseconds: 300),
          isCloseButton: false),
      type: AlertType.success,
      title: "Congrats",
      desc: "You have completed the quizz\nYour total score is $totalScore",
      buttons: [
        DialogButton(
          child: Text(
            "Now Fuck off",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(16, 6, 200, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  Resetscore() {
    quizzBrain.questionNum = 0;
    score.clear();
    showAlert();
    totalScore = 0;
  }

  addGreenIcon() {
    score.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
    totalScore++;
  }

  addRedIcon() {
    score.add(Icon(
      Icons.close,
      color: Colors.red,
    ));
  }

  void checkAnswer(bool pickedAnswer) {
    if (quizzBrain.getQuestionAnswer() == pickedAnswer) {
      addGreenIcon();
    } else {
      addRedIcon();
    }

    quizzBrain.nextQuestion();
    if (score.length == quizzBrain.getQuestionlenght() - 1) {
      Resetscore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green // Text Color
                  ),
              child: Text(
                'Truuuue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red // Text Color
                    ),
                child: Text(
                  'Falseeee',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    checkAnswer(false);
                  });
                }),
          ),
        ),
        Row(children: score)
      ],
    );
  }
}
