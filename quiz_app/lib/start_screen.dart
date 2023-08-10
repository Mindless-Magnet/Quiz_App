import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;  

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
             width: 300,
             color: Colors.white,
             ),
          const SizedBox(height: 80),
          Text(
          'Learn Flutter the Fun Way', 
          style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 80),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.ads_click_sharp),
            label: const Text('Start Quiz'),
            ),
        ],
      ),
      );
  }

}