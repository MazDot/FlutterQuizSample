import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(10, 10),
                      backgroundColor:
                          data['user_answer'] == data['correct_answer']
                              ? const Color.fromARGB(255, 6, 122, 49)
                              : const Color.fromARGB(255, 173, 23, 23),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Your Answer: ${data['user_answer']}',
                          style: TextStyle(
                            color: data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 6, 122, 49)
                                : const Color.fromARGB(255, 173, 23, 23),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer']}',
                          style: TextStyle(
                            color: data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 6, 122, 49)
                                : const Color.fromARGB(255, 51, 9, 203),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
