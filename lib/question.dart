import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_mobile/button_custom.dart';
import 'package:quiz_app_mobile/data/question.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.chooseAnswer});

  final void Function(String answer) chooseAnswer;
  @override
  State<Question> createState() => _Question();
}

class _Question extends State<Question> {
  var currentIndex = 0;

  void answerQuestion(answer) {
    widget.chooseAnswer(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // giúp các items chiếm full width của thằng cha
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 30),

            ...currentQuestion.getSuffeAnswer().map((answer) {
              return ButtonCustom(
                onTab: () => answerQuestion(answer),
                text: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}
