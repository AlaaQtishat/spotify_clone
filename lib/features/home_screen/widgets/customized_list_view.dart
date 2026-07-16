// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:spotify_clone/features/home_screen/views/widgets/customized_card.dart';
//
// class CustomizedListView extends StatelessWidget {
//   final bool isMadeForYouSection;
//   final List<Map<String, dynamic>> items;
//
//   const CustomizedListView({
//     super.key,
//     required this.items,
//     this.isMadeForYouSection = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: items.length,
//
//         separatorBuilder: (context, index) => SizedBox(width: 16.w),
//
//         itemBuilder: (context, index) {
//           final item = items[index];
//
//           return CustomizedCard(
//             isMadeForYou: isMadeForYouSection,
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => item["destination"]),
//               );
//             },
//             text: item["text"],
//             imgLink: item["imgLink"],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/features/home_screen/widgets/customized_card.dart';
import 'package:spotify_clone/features/music_player_screen/music_player_screen.dart';

class CustomizedListView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CustomizedListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        padding: EdgeInsets.only(right: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final item = items[index];

          return CustomizedCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      MusicPlayerScreen(playlist: items, initialIndex: index),
                ),
              );
            },
            text: item["text"],

            imgLink: item["image"],
          );
        },
      ),
    );
  }
}
