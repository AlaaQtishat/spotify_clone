import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotify_clone/features/home_screen/views/widgets/customized_card.dart';
import 'package:spotify_clone/features/home_screen/views/widgets/customized_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Made for you",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),

            CustomHorizontalList(
              cards: [
                CustomizedCard(
                  text: "Ed Sheeran, Katy Perry, Pitbull and more",
                  imgLink: "assets/images/ed_sheeran.jpg",
                ),
                CustomizedCard(
                  text: "Catch the Latest Playlist made just for you and also",
                  imgLink: "assets/images/justin_bieber.jpg",
                ),
                CustomizedCard(
                  text: "Late night beats curated just for you.",
                  imgLink: "assets/images/drake.jpg",
                ),
              ],
            ),
            SizedBox(height: 30.h),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Trending Now",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomHorizontalList(
              cards: [
                CustomizedCard(
                  text: "Believer \nSong . Imagine Dragons",
                  imgLink: "assets/images/believer.jpg",
                ),
                CustomizedCard(
                  text: "CHarley’s in Hawaii \nSong . Katy Perry",
                  imgLink: "assets/images/Harley.jpg",
                ),
                CustomizedCard(
                  text: "Cheap Trills \nSong . Imagine Dragons",
                  imgLink: "assets/images/cheepthrills.jpg",
                ),
              ],
            ),
            SizedBox(height: 30.h),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Top picks for you",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomHorizontalList(
              cards: [
                CustomizedCard(
                  text: "Memories \n Song . Maroon 5",
                  imgLink: "assets/images/maroon.jpg",
                ),
                CustomizedCard(
                  text: "Roar \nSong . Katy Perry",
                  imgLink: "assets/images/katyperry.jpg",
                ),
                CustomizedCard(
                  text: "Thunder \nSong . Imagine Dragons",
                  imgLink: "assets/images/imaginedragons.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
