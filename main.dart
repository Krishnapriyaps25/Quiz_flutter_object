import 'package:flutter/material.dart';
import 'package:quiz_game/quizbank.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbank quizBank = Quizbank();
void main() {
  runApp(Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Center(
            child: Text(
              'Quizzy 🪄',
              style: TextStyle(
                fontFamily: 'Vibur',
                fontSize: 30,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ScoreKeeper = [];
  void checkAnswer(userSelectedAnswer) {
    bool correctAnswer = quizBank.getQuestionAnswer();
    setState(() {
      if (quizBank.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You have finished the quiz successfully.',
        ).show();
        quizBank.reset();
        ScoreKeeper = [];
      } else {
        if (userSelectedAnswer == correctAnswer) {
          ScoreKeeper.add(Icon(Icons.done, color: Colors.green));
        } else {
          ScoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quizBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade200, fontSize: 25),
              ),
            ),
          ),
        ),
        SizedBox(height: 150),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
        Row(children: ScoreKeeper),
      ],
    );
  }
}



