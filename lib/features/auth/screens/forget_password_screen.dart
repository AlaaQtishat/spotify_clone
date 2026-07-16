import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/widgets/customized_buttons/customized_elevated_button.dart';
import 'package:spotify_clone/features/auth/auth_controller.dart';
import 'package:spotify_clone/features/auth/screens/widgets/customized_textfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  AuthController authController = AuthController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackground,
      appBar: AppBar(
        backgroundColor: AppColors.authBackground,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/forgotPassword.png",
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 32.sp,
                      letterSpacing: -0.3.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Don't worry! It happens. Please enter your email address to receive a reset link.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 32.sp),
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
                  SizedBox(height: 24.sp),
                  CustomizedElevatedButton(
                    content: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Send Reset Link",
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
                        String? error = await authController.resetPassword(
                          email: emailController.text,
                        );

                        setState(() {
                          isLoading = false;
                        });
                        if (error == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Reset link sent! Check your email.",
                              ),
                            ),
                          );

                          Navigator.of(context).pop();
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
          ),
        ),
      ),
    );
  }
}
