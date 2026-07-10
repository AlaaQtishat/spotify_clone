import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';
import 'package:spotify_clone/core/widgets/welcome_auth_layout.dart';
import 'package:spotify_clone/features/auth/views/signup_view.dart';
import 'package:spotify_clone/features/auth/views/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/views/main_layout_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeAuthLayout(
      bottomButtonText: "Sign up",
      onBottomButtonPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignupView()),
        );
      },
      child: Column(
        children: [
          CustomizedTextfield(text: "Username"),
          SizedBox(height: 12.h),
          CustomizedTextfield(text: "Password"),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerRight,
            child: CustomizedTextButton(
              text: "Forgot password?",
              onPressed: () {},
              textColor: const Color(0xFF4CAF50),
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 30.h),
          CustomizedElevatedButton(
            text: "Login",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainLayoutView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
