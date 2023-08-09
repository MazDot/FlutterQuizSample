import 'package:flutter/material.dart';
import 'package:flutter_quiz_sample/data/questions.dart';

import 'package:flutter_quiz_sample/questions_screen.dart';
import 'package:flutter_quiz_sample/start_screen.dart';
import 'package:flutter_quiz_sample/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'reults-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter the fun way',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First App'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 91, 183, 186),
                Color.fromARGB(255, 91, 186, 132)
              ],
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'questions-screen'
                  ? QuestionsScreen(chooseAnswer)
                  : ResultsScreen(chosenAnswers: selectedAnswers),
        ),
      ),
    );
  }
}
