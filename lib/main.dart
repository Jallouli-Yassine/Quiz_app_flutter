import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';


void main() {
  const List<Color> listC = [
    Color.fromARGB(255, 70, 29, 137),
    Color.fromARGB(255, 37, 16, 71),
  ];

  runApp(const QuizWidget(refresh: false));
}