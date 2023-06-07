import 'package:flutter/material.dart';
import 'package:quiz_app/asnwer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
const List<Color> listC = [
  Color.fromARGB(255, 70, 29, 137),
  Color.fromARGB(255, 37, 16, 71),
];

class QuestionsWidget extends StatefulWidget {
  const QuestionsWidget({required this.onSelectAnswer, super.key});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsWidget> createState() {
    return _QuestionsWidgetState();
  }
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: listC,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //center verticaly
            crossAxisAlignment: CrossAxisAlignment.stretch, //horizontale
            children: [
              Text(
                textAlign: TextAlign.center,
                currentQuestion.question,
                style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShiffledAnswers().map((answer) {
                // ... heya extract lel list f wost el list(map) bch nahiw el []
                return AnswerButton(
                  answer,
                  () {
                    answerQuestion(answer);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
