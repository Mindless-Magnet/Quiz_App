import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer('...');
    setState(() {
      currQuestionIndex +=1;
    });
  }


  @override
  Widget build(context) {

    final currentQuestion = questions[currQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children:  [
            Text(currentQuestion.text,
             style: GoogleFonts.lato(color: Colors.white,
              fontSize: 24,
               fontWeight: FontWeight.bold,
               ),
             textAlign: TextAlign.center,
             ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswers().map((item) {
              return AnswerButton(answerText: item,
               onTap: () {
                answerQuestion(item);
               } 
               );
            }),
          ],
        ),
      ),
    );
  }
}