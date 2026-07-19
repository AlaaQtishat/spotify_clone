import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/core/services/shared_prefs_service.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_text_button.dart';
import 'package:spotify_clone/core/widgets/welcome_auth_layout.dart';
import 'package:spotify_clone/features/auth/auth_controller.dart';
import 'package:spotify_clone/features/auth/screens/forget_password_screen.dart';
import 'package:spotify_clone/features/auth/screens/signup_screen.dart';
import 'package:spotify_clone/features/auth/screens/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/main_layout_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthController authController = AuthController();
  bool isRememberMeChecked = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SharedPrefsService sharedPrefsService = SharedPrefsService();

  @override
  void initState() {
    super.initState();
    loadSavedCredentials();
  }

  Future<void> loadSavedCredentials() async {
    String? savedEmail = await sharedPrefsService.getEmail();
    String? savedPassword = await sharedPrefsService.getPassword();

    setState(() {
      if (savedEmail != null) {
        emailController.text = savedEmail;
      }

      if (savedPassword != null) {
        passwordController.text = savedPassword;
        isRememberMeChecked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: WelcomeAuthLayout(
        bottomButtonText: "Sign up",
        onBottomButtonPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignupScreen()),
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

                if (val.length < 8) {
                  return "Password must be at least 8 characters";
                }

                if (!RegExp(r'[A-Z]').hasMatch(val)) {
                  return "Must contain at least one uppercase letter";
                }

                if (!RegExp(r'[a-z]').hasMatch(val)) {
                  return "Must contain at least one lowercase letter";
                }

                if (!RegExp(r'[0-9]').hasMatch(val)) {
                  return "Must contain at least one number";
                }

                if (!RegExp(r'[!@#\$&*~_=%^]+').hasMatch(val)) {
                  return "Must contain at least one special character";
                }

                return null;
              },
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 12.w),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Checkbox(
                        value: isRememberMeChecked,
                        activeColor: Colors.green,
                        side: const BorderSide(color: Colors.grey),
                        onChanged: (val) {
                          setState(() {
                            isRememberMeChecked = val!;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Remember me",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),

                CustomizedTextButton(
                  text: "Forgot password?",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                    );
                  },
                  textColor: const Color(0xFF4CAF50),
                  fontSize: 14.sp,
                ),
              ],
            ),
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
                    rememberMe: isRememberMeChecked,
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  setState(() {
                    isLoading = false;
                  });
                  if (context.mounted) {
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
