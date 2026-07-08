import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int value)
  onTap; // I googled it and found that there is another type which is ValueChanged<int> this is the same as the one I used, actually it is more readable so it is preferable to use.

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF121212).withOpacity(0.0),
            const Color(0xFF121212).withOpacity(0.85),
          ],
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        selectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        items: [
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.saved_search),
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.library_music),
            icon: Icon(Icons.library_music_outlined),
            label: 'Your Library',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/spotify_logo.png',
              width: 24.w,
              height: 24.w,
            ),
            icon: ImageIcon(
              const AssetImage('assets/images/spotify_small_logo.png'),
              size: 24.w,
            ),
            label: 'Premium',
          ),
        ],
      ),
    );
  }
}
