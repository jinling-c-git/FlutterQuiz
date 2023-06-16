import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QustionsScreeState();
  }
}

class _QustionsScreeState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromRGBO(240, 231, 252, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // map() convert the values in the list to other values
            // ... spread the items of the list into individual values
            // we call getShuffledAnswers() method to get a copy of answers with shuffled order
            // we didn't change the original the list of answers
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
                // we shouldn't do
                // onTap: answerQuestion(answer);
                // because the function of answerQuestion(answer) will be only triggered when the button was tapped
                // not when the button was created
              );
            })
          ],
        ),
      ),
    );
  }
}
