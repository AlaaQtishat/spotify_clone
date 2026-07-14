import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';

class CustomizedElevatedButton extends StatelessWidget {
  final Widget content;
  final VoidCallback? onPressed;
  const CustomizedElevatedButton({
    super.key,
    required this.content,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.elevatedButtonBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        fixedSize: Size(380.w, 54.h),
      ),
      child: content,
    );
  }
}
