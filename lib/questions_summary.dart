import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,
      {super.key, required this.isCorrectAnswer});

  final bool isCorrectAnswer;

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              
              final isCorrectAnswer = data['user_answer'] == data['correct_answer'];

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    child: Container(
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isCorrectAnswer
                            ? const Color.fromARGB(255, 255, 7, 168)
                            : Color.fromRGBO(45, 179, 251, 1),
                      ),
                      child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5 ,20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(color: Colors.pink),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(color: Colors.blue),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
