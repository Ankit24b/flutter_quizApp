import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Opacity(opacity: 0.5, child: Image.asset('assets/quiz1.png', 
        width: 160,
        //color: Colors.amberAccent,
        )),
        const SizedBox(height: 10,),
        const Text('Learn flutter development', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
        const SizedBox(height: 10,),
        OutlinedButton.icon(
          onPressed: startQuiz,
        icon: const Icon(Icons.quiz),
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white), 
        label: const Text('Click Here!')),
      ],)
    );
  }
}
