import 'package:flutter/material.dart';
import 'package:quiz_app/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(QuizAppView());

class QuizAppView extends StatefulWidget {
  const QuizAppView({Key? key}) : super(key: key);

  @override
  _QuizAppViewState createState() => _QuizAppViewState();
}

class _QuizAppViewState extends State<QuizAppView> {
  @override
  List<Widget> list = [];
  List<Question> questions = [
    Question('Your name is Ahsan', true),
    Question('you age is 15', false),
    Question('your village name is 18 8d', true)
  ];

  int questionNumber = 0;
  late var questionSize = questions.length;

  void checkAnswer(bool ans, bool trueAnswer, context) {
    if (ans == trueAnswer) {
      list.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      list.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    if (questionNumber < questions.length - 1) {
      questionNumber++;
    } else {
      showAlertDialogue(context);
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  questions[questionNumber].question,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "RFLUTTER ALERT",
                        desc: "Flutter is more awesome with RFlutter Alert.",
                      ).show();
                      setState(() {
                        checkAnswer(
                            questions[questionNumber].answer, true, context);
                      });
                    },
                    child: Text('Yes')),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          checkAnswer(
                              questions[questionNumber].answer, false, context);
                        },
                      );
                    },
                    child: Text('No')),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: list,
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlertDialogue(context) {
    Alert(
      context: context,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();
  }

// ···
}
