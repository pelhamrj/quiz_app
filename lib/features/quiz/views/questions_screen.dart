import 'package:flutter/material.dart';
import 'package:quiz_app/common_widgets/o2_elevated_button.dart';
import 'package:quiz_app/features/quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void selectAnswer(String answer) {
    widget.onSelectAnswer(answer);

    setState(() {
      if (currentQuestionIndex != questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 201, 153, 251),
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
                  (a) => Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: O2ElevatedButton(
                      onPressed: () {
                        selectAnswer(a);
                      },
                      child: Text(
                        a,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
