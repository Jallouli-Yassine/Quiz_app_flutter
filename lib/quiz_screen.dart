import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_widget.dart';

List<Color> listC = const [
  Color.fromARGB(255, 70, 29, 137),
  Color.fromARGB(255, 37, 16, 71),
];

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});
  @override
  State<QuizWidget> createState() {
    return _QuizWidgetState();
  }
}

class _QuizWidgetState extends State<QuizWidget> {
  final List<String> selectedAnswers = [];
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers.clear();
        activeScreen = 'menu-screen';
      });
    }
  }

  var activeScreen = 'menu-screen';

  void switchScreen() {
    setState(() {
      //setState taawd texecuti build (najmo nkoulo refresh lel screen)
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen == 'menu-screen'
            ? StartWidget(listC, switchScreen)
            : QuestionsWidget(onSelectAnswer: chooseAnswer),
      ),
    );
  }
}
