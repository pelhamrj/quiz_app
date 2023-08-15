import 'package:flutter/cupertino.dart';
import 'package:quiz_app/common_widgets/o2_button.dart';
import 'package:quiz_app/features/quiz/data/questions.dart';
import 'package:quiz_app/features/quiz/models/result_summary.dart';
import 'package:quiz_app/features/quiz/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.answers});

  final List<String> answers;

  List<ResultSummary> getSummaryData() {
    final List<ResultSummary> summary = [];

    for (final (index, answer) in answers.indexed) {
      summary.add(ResultSummary(
          questionIndex: index,
          question: questions[index].text,
          correctAnswer: questions[index].answers[0],
          userAnswer: answer));
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int correctAnswers = summaryData.where((result) => result.isCorrectAnswer()).length;
    final int totalAnswers = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalAnswers questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 201, 153, 251),
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            O2Button(onPressed: () {}, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
