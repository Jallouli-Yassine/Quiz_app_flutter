import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_widget.dart';
import 'package:quiz_app/result_screen.dart';

List<Color> listC = const [
  Color.fromARGB(255, 70, 29, 137),
  Color.fromARGB(255, 37, 16, 71),
];

class QuizWidget extends StatefulWidget {
  const QuizWidget({required this.refresh, Key? key}) : super(key: key);
  final bool refresh;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  List<String> selectedAnswers = [];
  bool refreshValue = false;
  var activeScreen = 'menu-screen';

  @override
  void initState() {
    super.initState();
    refreshValue = widget.refresh;
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (refreshValue) {
      setState(() {
        refreshValue = false;
        selectedAnswers.clear();
        activeScreen = 'questions-screen';
      });
    }

    Widget screen = StartWidget(listC, switchScreen);

    if (activeScreen == 'questions-screen') {
      screen = QuestionsWidget(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      screen = ResultWidget(chooseAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
