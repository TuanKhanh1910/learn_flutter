import 'package:flutter/material.dart';
import 'package:quiz_app_mobile/data/question.dart';
import 'package:quiz_app_mobile/home_screen.dart';
import 'package:quiz_app_mobile/question.dart';
import 'package:quiz_app_mobile/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreen();
}

class _QuizScreen extends State<QuizScreen> {
  var activeScreen = "home-screen";
  List<String> selectedAnswers = [];

  void changeScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget homeScreen = HomeScreen(startQuiz: changeScreen);

    if (activeScreen == "question-screen") {
      homeScreen = Question(chooseAnswer: chooseAnswer);
    }
    if (activeScreen == "result-screen") {
      homeScreen = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: homeScreen,
        ),
      ),
    );
  }
}
