import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedOutlinedButton extends StatelessWidget {
  final String text;
  final Widget icon;
  const CustomizedOutlinedButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},

      style: OutlinedButton.styleFrom(
        //backgroundColor: AppColors.elevatedButtonBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
          side: BorderSide(width: 1.sp, color: Colors.white),
        ),
        fixedSize: Size(380.w, 54.h),
      ),

      child: Row(
        children: [
          icon,
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4.sp,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
