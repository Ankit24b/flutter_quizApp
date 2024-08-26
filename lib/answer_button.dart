import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap,
      {super.key});  // Positional Argument

  // const AnswerButton({super.key,required this.answerText, required this.onTap,}); // Named Argument

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20,),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
    );
  }
}
