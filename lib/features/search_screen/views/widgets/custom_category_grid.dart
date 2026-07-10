import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotify_clone/features/search_screen/views/widgets/category_card.dart';

class CustomCategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  CustomCategoryGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: categories.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.6,
      ),

      itemBuilder: (context, index) {
        var category = categories[index];
        return CategoryCard(title: category["title"], color: category["color"]);
      },
    );
  }
}
