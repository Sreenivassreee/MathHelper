import 'package:flutter/material.dart';
import 'package:math_helper/Learn.dart';
import 'package:math_helper/MyHomaPage.dart';
import 'package:math_helper/QuestionsEnterPage.dart';
import 'package:math_helper/motivation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math Crush Helper",
      debugShowCheckedModeBanner: false,
      home: MyHomaPage(),
      routes: {
        '/home': (context) => MyHomaPage(),
        '/EnterQuestions': (context) => EnterQuestions(),
        '/Motivation': (context) => Motivation(),
        '/Learn': (context) => Learn()
      },
    );
  }
}
