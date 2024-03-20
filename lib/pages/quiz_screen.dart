import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/result_screen.dart';
import 'package:quiz_app/widgets/widgets.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = questions;
  int currentQuestionIndex = 0;
  List<Answer?> selectedAnswers = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<Answer?>.filled(questionList.length, null);
  }

  @override
  Widget build(BuildContext context) {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;
    return Scaffold(
      backgroundColor: const Color(0xffFFF9E4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.help,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${currentQuestionIndex + 1}/${questionList.length.toString()}",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "$score points",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Text(
                    questionList[currentQuestionIndex].question,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: questionList[currentQuestionIndex]
                    .answers
                    .map(
                      (e) => AnswerButton(
                        answer: e,
                        isSelected: e == selectedAnswers[currentQuestionIndex],
                        onPressed: (answer) {
                          setState(() {
                            selectedAnswers[currentQuestionIndex] = answer;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NextButton(
                    isLastQuestion: isLastQuestion,
                    onPressed: () {
                      if (selectedAnswers[currentQuestionIndex] != null) {
                        setState(
                          () {
                            if (selectedAnswers[currentQuestionIndex]!
                                .isCorrect) {
                              score += 10;
                            }
                            if (!isLastQuestion) {
                              currentQuestionIndex++;
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    selectedAnswers: selectedAnswers,
                                    score: score,
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget showScoreDialog() {
  //   return AlertDialog(
  //     title: const Text(""),
  //     content: Text(
  //       'Puanınız $score',
  //       style: GoogleFonts.roboto(
  //         fontWeight: FontWeight.w400,
  //         color: Colors.black,
  //         fontSize: 18,
  //       ),
  //     ),
  //     actions: [
  //       TextButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //           setState(() {
  //             currentQuestionIndex = 0;
  //             score = 0;
  //             selectedAnswers = List<Answer?>.filled(questionList.length, null);
  //           });
  //         },
  //         child: Text(
  //           'Close',
  //           style: GoogleFonts.roboto(
  //             fontWeight: FontWeight.w400,
  //             color: Colors.black,
  //             fontSize: 18,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
