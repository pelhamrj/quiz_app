import 'package:flutter/material.dart';
import 'package:quiz_app/common_widgets/o2_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(175, 255, 255, 255),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 80, bottom: 30),
            child: Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 201, 153, 251),
              ),
            ),
          ),
          O2Button.icon(
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
            onPressed: startQuiz,
          )
        ],
      ),
    );
  }
}
