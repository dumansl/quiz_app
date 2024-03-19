import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constant/screen_util.dart';

class NextButton extends StatelessWidget {
  final bool isLastQuestion;
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.isLastQuestion,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
      onPressed: onPressed,
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
}
