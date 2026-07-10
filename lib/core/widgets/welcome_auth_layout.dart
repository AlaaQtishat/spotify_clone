import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';

class WelcomeAuthLayout extends StatelessWidget {
  final Widget child;
  final String bottomButtonText;
  final VoidCallback onBottomButtonPressed;

  const WelcomeAuthLayout({
    super.key,
    required this.child,
    required this.bottomButtonText,
    required this.onBottomButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.authBackground,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 160.h),

                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/spotify_small_logo.png",
                            width: 100.w,
                            height: 100.h,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Millions of songs,",
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 32.sp,
                            letterSpacing: -0.3.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Free on Spotify.",
                          style: TextStyle(
                            fontFamily: 'Gotham',
                            fontSize: 32.sp,
                            letterSpacing: -0.3.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        child,

                        const Spacer(),

                        CustomizedTextButton(
                          text: bottomButtonText,
                          onPressed: onBottomButtonPressed,
                        ),
                        SizedBox(height: 128.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
