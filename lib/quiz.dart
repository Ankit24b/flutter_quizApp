import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget{       // StatefulWidget takes 2 classes
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{      // _QuizState is a private class belongs to Quiz class
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }
  
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers,
      onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 102, 3, 127),
                Color.fromARGB(255, 138, 12, 140),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}