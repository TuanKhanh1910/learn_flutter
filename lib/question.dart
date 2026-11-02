import 'package:flutter/material.dart';
import 'package:quiz_app_mobile/button_custom.dart';
import 'package:quiz_app_mobile/data/question.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _Question();
}

class _Question extends State<Question> {
  var currentIndex = 0;

  final currentQuestion = questions[0];
  void answerQuestion() {
    setState(() {
      currentIndex++;
    });
    print("test $currentIndex");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // giúp các items chiếm full width của thằng cha
          children: [
            Text(currentQuestion.text, style: TextStyle(color: Colors.white)),
            SizedBox(height: 30),

            ...currentQuestion.getSuffeAnswer().map((answer) {
              return ButtonCustom(onTab: answerQuestion, text: answer);
            }),
          ],
        ),
      ),
    );
  }
}
