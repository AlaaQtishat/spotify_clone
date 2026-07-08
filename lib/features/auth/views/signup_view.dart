import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';
import 'package:spotify_clone/features/auth/views/login_view.dart';
import 'package:spotify_clone/features/auth/views/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/views/main_layout_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                      SizedBox(height: 20.h),
                      CustomizedTextfield(text: "Username"),
                      SizedBox(height: 12.h),
                      CustomizedTextfield(text: "Password"),
                      SizedBox(height: 16.h),

                      SizedBox(height: 60.h),
                      CustomizedElevatedButton(
                        text: "Sign up",
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
                        text: "Log in",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
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
