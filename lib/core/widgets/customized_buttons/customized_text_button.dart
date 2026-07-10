import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedTextButton extends StatelessWidget {
  String text;
  Color textColor;
  VoidCallback onPressed;
  double? fontSize;
  CustomizedTextButton({
    super.key,
    required this.text,

    required this.onPressed,
    this.textColor = Colors.white,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: fontSize ?? 21.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3.sp,
        ),
      ),
    );
  }
}
