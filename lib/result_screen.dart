import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
const List<Color> listC = [
  Color.fromARGB(255, 70, 29, 137),
  Color.fromARGB(255, 37, 16, 71),
];

class ResultWidget extends StatelessWidget {
  const ResultWidget({required this.chooseAnswers, super.key});
  final List<String> chooseAnswers;

  List<Map<String, Object>> getStats() {
    List<Map<String, Object>> l = [];
    for (int i = 0; i < chooseAnswers.length; i++) {
      l.add({
        'index': i,
        'question': questions[i].question,
        'reponse': chooseAnswers[i],
        'correctOne': questions[i].ansswers[0],
        'trueOrFalse':
            chooseAnswers[i] == questions[i].ansswers[0] ? true : false,
      });
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    final listOfData = getStats();
    final totalQuestions = questions.length;
    final nbCorect = listOfData
        .where((element) => element['reponse'] == element['correctOne'])
        .length;

    final indexOfTrue = listOfData
        .where((element) => element['reponse'] == element['correctOne']);

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: listC,
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //center verticaly
          crossAxisAlignment: CrossAxisAlignment.stretch, //horizontale
          children: [
            Text(
              textAlign: TextAlign.center,
              'you answered $nbCorect of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: listOfData.map((data) {
                    return Row(
                      children: [
                        Text(
                          ((data['index'] as int) + 1).toString(),
                          style: GoogleFonts.lato(
                            color: data['trueOrFalse'] == true
                                ? Color.fromARGB(255, 255, 255, 255)
                                : Color.fromARGB(255, 255, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                data['question'] as String,
                                style: GoogleFonts.lato(
                                  color: Color.fromARGB(255, 0, 252, 172),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                data['reponse'] as String,
                                style: GoogleFonts.lato(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                data['correctOne'] as String,
                                style: GoogleFonts.lato(
                                  color: Color.fromARGB(255, 0, 247, 255),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizWidget(refresh: true),
                    ));
              },
              icon: const Icon(Icons.replay_outlined),
              label: const Text("Restart The Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
