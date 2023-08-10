import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesttionsSummary extends StatelessWidget {

  const QuesttionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data)  {
          return Row(children: [
            Text(((data['question_index'] as int) + 1).toString(),
            style: GoogleFonts.lato(fontSize: 18,
             color: Colors.black,
             fontWeight: FontWeight.bold,)),
            Expanded(
              child: Column(
                children: [
                Text((data['question']) as String, style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.yellowAccent,
                  ),),
                const SizedBox(height: 5,),
                Text((data['user_answer']) as String, style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue,
                  )),
                const SizedBox(height: 5,),
                Text((data['correct_answer']) as String, style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                  )),
                  SizedBox(height: 10,)
              ],),
            )
          ]);
        },
        ).toList(),
        ),
      ),
    );
  }


}