import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question.dart';

class ResultScreen extends StatelessWidget {
  final List<Answer?> selectedAnswers;
  final int score;
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF9E4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TEST SONUCU",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < selectedAnswers.length; i++) ...[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${i + 1}. Sorunun Verilen Cevap',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: '\n${selectedAnswers[i]}',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              "TOPLAM PUAN : $score",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
