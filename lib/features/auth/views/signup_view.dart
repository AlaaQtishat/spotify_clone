import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/core/widgets/welcome_auth_layout.dart';
import 'package:spotify_clone/features/auth/auth_controller.dart';
import 'package:spotify_clone/features/auth/views/login_view.dart';
import 'package:spotify_clone/features/auth/views/widgets/customized_textfield.dart';
import 'package:spotify_clone/features/main_layout/views/main_layout_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthController authController = AuthController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: WelcomeAuthLayout(
        bottomButtonText: "Log in",
        onBottomButtonPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginView()),
          );
        },
        child: Column(
          children: [
            CustomizedTextfield(
              hint: "Full Name",
              controller: nameController,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Name is required";
                }

                if (val.trim().length < 2) {
                  return "Name must be at least 2 characters";
                }

                if (val.trim().length > 30) {
                  return "Name is too long";
                }

                return null;
              },
            ),
            SizedBox(height: 12.h),
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
            SizedBox(height: 12.h),
            CustomizedTextfield(
              hint: "Confirm Password",
              isPassword: true,
              controller: confirmPasswordController,
              validator: (val) {
                if (val == null || val.isEmpty)
                  return "Confirm Password is required";
                if (passwordController.text != confirmPasswordController.text)
                  return "passwords don't match";

                return null;
              },
            ),
            SizedBox(height: 50.h),
            CustomizedElevatedButton(
              content: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Sign up",
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

                  String? error = await authController.signUpEmailPassword(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  setState(() {
                    isLoading = false;
                  });

                  if (error == null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainLayoutView(),
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
