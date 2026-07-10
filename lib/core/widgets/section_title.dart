import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        letterSpacing: -0.5.sp,
        fontFamily: "Gotham",
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
