import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';
import 'package:spotify_clone/features/auth/views/signup_view.dart';
import 'package:spotify_clone/features/auth/views/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/views/main_layout_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  child: Column(
                    children: [
                      Spacer(flex: 3),
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
                      SizedBox(height: 20.h),
                      CustomizedTextfield(text: "Username"),
                      SizedBox(height: 12.h),
                      CustomizedTextfield(text: "Password"),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,

                        child: CustomizedTextButton(
                          text: "Forgot password?",
                          onPressed: () {},
                          textColor: Color(0xFF4CAF50),
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      CustomizedElevatedButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainLayoutView(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 60.h),
                      CustomizedTextButton(
                        text: "Sign up",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignupView(),
                            ),
                          );
                        },
                      ),
                      Spacer(flex: 1),
                    ],
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
