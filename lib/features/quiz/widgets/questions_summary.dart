import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/constants/colors.dart';
import 'package:quiz_app/features/quiz/models/result_summary.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<ResultSummary> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary
              .map(
                (result) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: result.isCorrectAnswer()
                              ? kSuccessColor
                              : kFailureColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            result.getQuestionNumber().toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              result.question,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kResultTextColor,
                              ),
                            ),
                            Text(
                              result.correctAnswer,
                              style: TextStyle(
                                color: kResultTextColor,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: result.isCorrectAnswer()
                                        ? kSuccessColor
                                        : kFailureColor),
                                children: [
                                  const TextSpan(
                                    text: 'You answered: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: result.userAnswer,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
