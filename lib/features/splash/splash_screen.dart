import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/features/main_layout/main_layout_screen.dart';

import 'package:spotify_clone/features/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();

    _navigateBasedOnAuth();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.onboardingBackground,
        body: Center(
          child: Image.asset(
            "assets/images/spotify_logo.png",
            width: 245.w,
            height: 245.h,
          ),
        ),
      ),
    );
  }

  void _navigateBasedOnAuth() {
    Future.delayed(const Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainLayoutScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    });
  }
}
