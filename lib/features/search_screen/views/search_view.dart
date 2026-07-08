import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/features/search_screen/views/widgets/category_card.dart';
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
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),
                SearchField(),
                SizedBox(height: 24.h),
                Text(
                  "Your top genres",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomCategoryGrid(
                  categories: [
                    CategoryCard(title: "pop", color: AppColors.cardPurple),
                    CategoryCard(
                      title: "Bollywood",
                      color: AppColors.cardDarkRed,
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Text(
                  "Browse all",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomCategoryGrid(
                  categories: [
                    CategoryCard(
                      title: "Podcasts",
                      color: AppColors.cardOrange,
                    ),
                    CategoryCard(
                      title: "New\nReleases",
                      color: AppColors.cardPink,
                    ),
                    CategoryCard(title: "Charts", color: AppColors.cardPurple),
                    CategoryCard(
                      title: "Concerts",
                      color: AppColors.cardDarkBlue,
                    ),
                    CategoryCard(
                      title: "Made for\nyou",
                      color: AppColors.cardDarkBlue,
                    ),
                    CategoryCard(title: "At home", color: AppColors.cardTeal),
                    CategoryCard(
                      title: "At work",
                      color: AppColors.cardDarkRed,
                    ),
                    CategoryCard(title: "At car", color: AppColors.cardGreen),
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
