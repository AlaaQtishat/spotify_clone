import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/models/song_model.dart';
import 'package:spotify_clone/features/home_screen/widgets/customized_card.dart';
import 'package:spotify_clone/features/music_player_screen/music_player_screen.dart';

class CustomizedListView extends StatelessWidget {
  final List<SongModel> items;

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
            text: item.text!,

            imgLink: item.image,
          );
        },
      ),
    );
  }
}
