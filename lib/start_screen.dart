import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(context){
    return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(
                   'assets/images/quizlogo.png',
                    width: 200,
                    color: const Color.fromARGB(175, 255, 255, 255)
                  ),
                //Opacity(
                //  opacity: 0.6,
                //  child: Image.asset(
                //   'assets/images/quizlogo.png',
                //    width: 200,
                //  ),
                //),
                const SizedBox(height: 50,),
                Text(
                  'Learn Flutter the fun way!',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 25,),
                OutlinedButton.icon(
                 onPressed: startQuiz,
                 style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 22,
                  ),
                 ),
                 icon: const Icon(Icons.arrow_right_alt),
                 label: const Text('Start Quiz'),
                )
              ],
      ),
    );
  }
}