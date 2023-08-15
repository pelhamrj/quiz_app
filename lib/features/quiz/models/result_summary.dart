class ResultSummary {
  const ResultSummary({required this.questionIndex, required this.question, required this.correctAnswer, required this.userAnswer });

  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  bool isCorrectAnswer() {
    return correctAnswer.toLowerCase() == userAnswer.toLowerCase();
  }

  int getQuestionNumber() {
    return questionIndex + 1;
  }
}
