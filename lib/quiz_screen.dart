import 'package:flutter/material.dart';
import 'package:quiz_app_mobile/home_screen.dart';
import 'package:quiz_app_mobile/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreen();
}

class _QuizScreen extends State<QuizScreen> {
  var activeScreen = "start-screen";

  void changeScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: activeScreen == "start-screen"
              ? HomeScreen(startQuiz: changeScreen)
              : Question(),
        ),
      ),
    );
  }
}
