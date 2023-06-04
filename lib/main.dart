import 'package:flutter/material.dart';
import 'package:quiz_app/start_widget.dart';

void main() {
  const List<Color> listC = [
    Color.fromARGB(255, 70, 29, 137),
    Color.fromARGB(255, 37, 16, 71),
  ];

  runApp(
    const MaterialApp(
      home: Scaffold(
        body: StartWidget(listC),
      ),
    ),
  );
}
