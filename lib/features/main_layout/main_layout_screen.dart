import 'package:flutter/material.dart';
import 'package:spotify_clone/core/widgets/gradient_background.dart';
import 'package:spotify_clone/features/home_screen/home_screen.dart';
import 'package:spotify_clone/features/library_screen/library_screen.dart';
import 'package:spotify_clone/features/main_layout/widgets/custom_bottom_nav_bar.dart';
import 'package:spotify_clone/features/main_layout/widgets/right_drawer.dart';
import 'package:spotify_clone/features/premium_screen/premium_screen.dart';

import 'package:spotify_clone/features/search_screen/search_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const PremiumScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      body: Scaffold(
        endDrawer: RightDrawer(),
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
