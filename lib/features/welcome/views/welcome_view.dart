import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';
import 'package:spotify_clone/features/welcome/views/widgets/customized_outlined_button.dart';
import 'package:spotify_clone/features/auth/views/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.authBackground,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Spacer(flex: 2),
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
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "Free on Spotify.",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 55.h),
              CustomizedElevatedButton(text: "Sign up free"),
              SizedBox(height: 6.sp),
              CustomizedOutlinedButton(
                text: "Continue with phone number",
                icon: Icon(
                  Icons.phone_android_rounded,
                  size: 30.w,
                  color: Colors.white,
                ),
                //Image.asset('assets/icons/phone.png', width: 32.w),
              ),
              SizedBox(height: 6.h),
              CustomizedOutlinedButton(
                text: "Continue with Google",
                icon: Image.asset('assets/icons/google.png', width: 30.w),
              ),
              SizedBox(height: 6.h),
              CustomizedOutlinedButton(
                text: "Continue with Google",
                icon: Image.asset('assets/icons/facebook.png', width: 30.w),
              ),
              SizedBox(height: 6.h),
              CustomizedTextButton(
                text: "Log in",
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => LoginView()));
                },
              ),

              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
