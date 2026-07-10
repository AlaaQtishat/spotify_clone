import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/widgets/section_title.dart';
import 'package:spotify_clone/features/search_screen/views/widgets/custom_category_grid.dart';
import 'package:spotify_clone/features/search_screen/views/widgets/search_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              left: 16.w,
              right: 16.w,
              top: 48.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    fontFamily: "Gotham",
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1.92.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                SearchField(),
                SizedBox(height: 24.h),
                SectionTitle(title: "Your top genres"),

                SizedBox(height: 24.h),
                CustomCategoryGrid(
                  categories: [
                    {"title": "Pop", "color": AppColors.cardPurple},
                    {"title": "Bollywood", "color": AppColors.cardDarkRed},
                  ],
                ),
                SizedBox(height: 32.h),
                SectionTitle(title: "Browse all"),

                SizedBox(height: 24.h),
                CustomCategoryGrid(
                  categories: [
                    {"title": "Podcasts", "color": AppColors.cardOrange},
                    {"title": "New\nReleases", "color": AppColors.cardPink},
                    {"title": "Charts", "color": AppColors.cardPurple},
                    {"title": "Concerts", "color": AppColors.cardDarkBlue},
                    {"title": "Made for\nyou", "color": AppColors.cardDarkBlue},
                    {"title": "At home", "color": AppColors.cardTeal},
                    {"title": "At work", "color": AppColors.cardDarkRed},
                    {"title": "At car", "color": AppColors.cardGreen},
                  ],
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
