import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  Widget body;
  GradientBackground({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF484C4D), Color(0xFF121212), Color(0xFF121212)],
        ),
      ),
      child: body,
    );
  }
}
