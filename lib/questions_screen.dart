import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';

//import 'package:quiz_app/models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState(); // it is instance of class
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);

    setState(() {           // it tell flutter build function should be call again
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.laila(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {                  // Spread values (...) it pulls list items as individual
              return AnswerButton(item, () {
                answerQuestion(item);
              });
            })
            // AnswerButton(answerText:'Answer Text..', onTap:() {}),  // Named Argument
            // AnswerButton(currentQuestion.answers[0], () {}),        // Positional Argument
          ],
        ),
      ),
    );
  }
}
