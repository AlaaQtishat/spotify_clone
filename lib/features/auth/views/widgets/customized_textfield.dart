import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedTextfield extends StatelessWidget {
  String text;
  CustomizedTextfield({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 50.h,
        width: double.infinity,
        child: TextField(
          cursorColor: Colors.grey.shade600,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,

            hintText: text,
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.10),
                width: 0.5,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.10),
                width: 0.5,
              ),
            ),

            // border just in case
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.10),
                width: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
