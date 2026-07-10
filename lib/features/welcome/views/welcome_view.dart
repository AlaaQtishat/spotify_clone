import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/welcome_auth_layout.dart';
import 'package:spotify_clone/features/auth/views/signup_view.dart';
import 'package:spotify_clone/features/welcome/views/widgets/customized_outlined_button.dart';
import 'package:spotify_clone/features/auth/views/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeAuthLayout(
      bottomButtonText: "Log in",
      onBottomButtonPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const LoginView()));
      },
      child: Column(
        children: [
          SizedBox(height: 15.h),
          CustomizedElevatedButton(
            text: "Sign up free",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignupView()),
              );
            },
          ),
          SizedBox(height: 6.h),
          CustomizedOutlinedButton(
            text: "Continue with phone number",
            icon: Icon(
              Icons.phone_android_rounded,
              size: 30.w,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6.h),
          CustomizedOutlinedButton(
            text: "Continue with Google",
            icon: Image.asset('assets/icons/google.png', width: 30.w),
          ),
          SizedBox(height: 6.h),
          CustomizedOutlinedButton(
            text: "Continue with Facebook",
            icon: Image.asset('assets/icons/facebook.png', width: 30.w),
          ),
        ],
      ),
    );
  }
}
