import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/data/app_data.dart';
import 'package:spotify_clone/core/widgets/section_title.dart';
import 'package:spotify_clone/features/home_screen/widgets/customized_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionTitle(title: "Made for you"),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.history_sharp,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomizedListView(items: AppData.madeForYouData),
              SizedBox(height: 30.h),
              const SectionTitle(title: "Trending Now"),
              SizedBox(height: 20.h),
              CustomizedListView(items: AppData.trendingNowData),
              SizedBox(height: 30.h),
              const SectionTitle(title: "Top picks for you"),
              SizedBox(height: 20.h),
              CustomizedListView(items: AppData.topPicksData),
            ],
          ),
        ),
      ),
    );
  }
}
