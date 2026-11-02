class QuizQuestion {
  const QuizQuestion(this.text, this.answer);
  final String text;

  final List<String> answer;

  List<String> getSuffeAnswer() {
    final shuffeList = List.of(answer);
    shuffeList.shuffle();

    return shuffeList;
  }
}
