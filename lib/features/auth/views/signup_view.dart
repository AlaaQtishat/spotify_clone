import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/welcome_auth_layout.dart';
import 'package:spotify_clone/features/auth/views/login_view.dart';
import 'package:spotify_clone/features/auth/views/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/views/main_layout_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeAuthLayout(
      bottomButtonText: "Log in",
      onBottomButtonPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      },
      child: Column(
        children: [
          CustomizedTextfield(text: "Username"),
          SizedBox(height: 12.h),
          CustomizedTextfield(text: "Password"),
          SizedBox(height: 60.h),
          CustomizedElevatedButton(
            text: "Sign up",
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
