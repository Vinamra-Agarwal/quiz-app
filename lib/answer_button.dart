import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({
    super.key,
    required this.onTap,
    required this.answerText,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40, 
          vertical: 10
        ),
        backgroundColor: const Color.fromARGB(255, 11, 2, 135),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ), 
      child: Text(answerText, textAlign: TextAlign.center,),
      );
  }
}