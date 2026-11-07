import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final questionNumber = (data["question_index"] as int) + 1;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$questionNumber"),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data["question"]}"),
                    Text("Your answer: ${data["user_answer"]}"),
                    Text("Correct answer: ${data["correct_answer"]}"),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(), // vì khi dùng map thì nó trả về 1 Iterable nên cần toList() để convert sang List
    );
  }
}
