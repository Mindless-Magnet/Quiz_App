import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.reset});

  final List<String> chosenAnswers;
  final void Function() reset;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i =0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final TotalQuestions = questions.length;
    final CorrectQuestions = summarydata.where((data) {
      return (data['user_answer'] == data['correct_abswer']);
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You answered $CorrectQuestions out of $TotalQuestions questions correctly!',),
            const SizedBox(height: 30,),
            QuesttionsSummary(summarydata),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: reset,
               child: const Text('Restart'))
          ],
        ),
      ),
    );
  }
}