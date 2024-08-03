import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

    List<Map<String, Object>> getSummaryData(){
      final List<Map<String, Object>> summary = [];

      for(var i=0; i < chosenAnswer.length; i++){
        summary.add(
          {
            'question-index': i,
            'question': questions[i].text,
            'correct_answer': questions[i].answers[0],
            'user_answer': chosenAnswer[i]
          }
        );
      }

      return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = (summaryData.where((data) {
      return data['correct_answer'] == data['user_answer']; 
    }).length);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.restart_alt),
            )
          ],
        ),
      ),
    );
  }
}