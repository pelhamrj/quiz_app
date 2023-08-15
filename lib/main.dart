import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quiz_app/theme/color_scheme.dart';
import 'package:quiz_app/theme/primary_text_theme.dart';
import 'package:quiz_app/theme/text_theme.dart';
import 'package:quiz_app/features/quiz/quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
            colorScheme: kColorScheme,
            primaryTextTheme: kPrimaryTextTheme,
            textTheme: kTextTheme,
            useMaterial3: true),
        home: const Quiz());
  }
}
