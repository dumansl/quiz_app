import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/constant/screen_util.dart';

class AnswerButton extends StatelessWidget {
  final Answer answer;
  final bool isSelected;
  final Function(Answer) onPressed;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = const Color(0xffF2CA3C);
    return SizedBox(
      width: ScreenUtil.getWidth(context) * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: isSelected ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fixedSize: Size(
            ScreenUtil.getWidth(context) * 0.7,
            ScreenUtil.getHeight(context) * 0.08,
          ),
          backgroundColor:
              isSelected ? buttonColor.withOpacity(0.6) : buttonColor,
        ),
        onPressed: () => onPressed(answer),
        child: Text(
          answer.answer,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
