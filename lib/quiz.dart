import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState(){
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }
  void switchScreen() {
    setState( () {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer ,);
    });
  } 

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(restartScreen,chosenAnswer: selectedAnswers ,);
      });
    }
  }

  void restartScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer ,);
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 14, 2, 247),
                Color.fromARGB(255, 64, 67, 230)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                ),
          ),
          child: activeScreen,
        )
      ),
    );
  }
}