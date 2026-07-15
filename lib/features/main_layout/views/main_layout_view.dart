import 'package:flutter/material.dart';
import 'package:spotify_clone/core/widgets/gradient_background.dart';
import 'package:spotify_clone/features/home_screen/views/home_view.dart';
import 'package:spotify_clone/features/library_screen/views/library_view.dart';
import 'package:spotify_clone/features/main_layout/views/widgets/custom_bottom_nav_bar.dart';
import 'package:spotify_clone/features/main_layout/views/widgets/right_drawer.dart';
import 'package:spotify_clone/features/premium_screen/views/premium_view.dart';
import 'package:spotify_clone/features/search_screen/views/search_view.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  final List<Widget> _screens = [
    const HomeView(),
    const SearchView(),
    const LibraryView(),
    const PremiumView(),
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
