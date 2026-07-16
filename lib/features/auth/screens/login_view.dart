import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';
import 'package:spotify_clone/core/widgets/welcome_auth_layout.dart';
import 'package:spotify_clone/features/auth/auth_controller.dart';
import 'package:spotify_clone/features/auth/screens/forget_password_screen.dart';
import 'package:spotify_clone/features/auth/screens/signup_view.dart';
import 'package:spotify_clone/features/auth/screens/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/main_layout_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthController authController = AuthController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: WelcomeAuthLayout(
        bottomButtonText: "Sign up",
        onBottomButtonPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignupView()),
          );
        },
        child: Column(
          children: [
            CustomizedTextfield(
              hint: "Email",
              controller: emailController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Email is required";
                }

                if (!RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
                ).hasMatch(val)) {
                  return "Please enter a valid email address";
                }

                return null;
              },
            ),
            SizedBox(height: 12.h),
            CustomizedTextfield(
              hint: "Password",
              isPassword: true,
              controller: passwordController,
              validator: (val) {
                if (val == null || val.isEmpty) return "Password is required";

                if (val.length < 8)
                  return "Password must be at least 8 characters";

                if (!RegExp(r'[A-Z]').hasMatch(val))
                  return "Must contain at least one uppercase letter";

                if (!RegExp(r'[a-z]').hasMatch(val))
                  return "Must contain at least one lowercase letter";

                if (!RegExp(r'[0-9]').hasMatch(val))
                  return "Must contain at least one number";

                if (!RegExp(r'[!@#\$&*~_=%^]+').hasMatch(val))
                  return "Must contain at least one special character";

                return null;
              },
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: CustomizedTextButton(
                text: "Forgot password?",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordScreen(),
                    ),
                  );
                },
                textColor: const Color(0xFF4CAF50),
                fontSize: 16.sp,
              ),
            ),
            //  SizedBox(height: 60.h),
            CustomizedElevatedButton(
              content: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Log in",
                      style: GoogleFonts.poppins(
                        letterSpacing: -0.3.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 21.sp,
                      ),
                    ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });

                  String? error = await authController.loginEmailPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  setState(() {
                    isLoading = false;
                  });

                  if (error == null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainLayoutScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error)));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
