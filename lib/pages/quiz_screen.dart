import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constant/screen_util.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = questions;
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  int score = 0;

  @override
  void initState() {
    score;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9E4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 15,
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
              flex: 30,
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
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: questionList[currentQuestionIndex]
                    .answers
                    .map(
                      (e) => answerButton(e),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  nextButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showScoreDialog() {
    return AlertDialog(
      title: const Text(""),
      content: Text(
        'Puanınız $score',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            });
          },
          child: Text(
            'Close',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget nextButton() {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: const Color(0xffFF3737),
        elevation: 0,
        fixedSize: Size(
          ScreenUtil.getWidth(context) * 0.7,
          ScreenUtil.getHeight(context) * 0.08,
        ),
      ),
      onPressed: () {
        if (selectedAnswer != null) {
          setState(
            () {
              if (selectedAnswer!.isCorrect) {
                score = score + 10;
              }
              selectedAnswer = null;
              if (!isLastQuestion) {
                currentQuestionIndex++;
              } else {
                showDialog(context: context, builder: (_) => showScoreDialog());
              }
            },
          );
        }
      },
      child: Text(
        isLastQuestion ? "GÖNDER" : "İLERİ",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.08,
      width: ScreenUtil.getWidth(context) * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: isSelected ? const Color(0xffF03986) : Colors.white,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            setState(
              () {
                selectedAnswer = answer;
              },
            );
          }
        },
        child: Text(
          answer.answer,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
